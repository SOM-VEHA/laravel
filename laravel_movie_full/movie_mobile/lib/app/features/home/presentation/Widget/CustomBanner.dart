import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/SlideProvider.dart';

class CustomBanner extends ConsumerStatefulWidget {
  CustomBanner({super.key, this.onTap});
  final VoidCallback? onTap;
  @override
  ConsumerState<CustomBanner> createState() => _CustomBannerState();
}

class _CustomBannerState extends ConsumerState<CustomBanner> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final slidesAsync = ref.watch(slidesProvider);

    return SliverToBoxAdapter(
      child: slidesAsync.when(
        loading: () => const SizedBox(
          height: 200,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),

        error: (error, stackTrace) => SizedBox(
          height: 200,
          child: Center(
            child: Text('Error: $error'),
          ),
        ),

        data: (slides) {
          if (slides.isEmpty) {
            return const SizedBox.shrink();
          }

          if (currentIndex >= slides.length) {
            currentIndex = 0;
          }

          return Stack(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: slides.length,

                  itemBuilder: (context, index, realIndex) {
                    final item = slides[index];

                    return Container(
                      margin: const EdgeInsets.all(10),
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: '${item.image}',
                          fit: BoxFit.cover,
                          placeholder: (context, url) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },

                          errorWidget: (context, url, error) {
                            return const Center(
                              child: Icon(
                                Icons.broken_image,
                                size: 50,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },

                  options: CarouselOptions(
                    height: 200,
                    scrollPhysics:
                    const BouncingScrollPhysics(),
                    autoPlay: true,
                    aspectRatio: 2,
                    viewportFraction: 1,

                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),

              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: slides.asMap().entries.map((entry) {
                    final index = entry.key;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 200,
                        ),
                        width: currentIndex == index ? 17 : 7,
                        height: 7,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 3,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(10),
                          color: currentIndex == index
                              ? Colors.red
                              : Colors.teal,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
