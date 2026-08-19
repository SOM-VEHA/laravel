import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:movie_mobile/app/features/favorite/presentation/provider/getFavoriteProvider.dart';
import 'package:movie_mobile/app/features/movie/presentation/screen/MovieDetailScreen.dart';
import 'package:movie_mobile/app/features/movie/presentation/screen/Widget/CustomMovie.dart';

class FavoriteAll extends ConsumerWidget {
  const FavoriteAll({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorite = ref.watch(getFavoriteProvider);
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: favorite.when(
        loading: () => const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),

        error: (error, stack) => SliverToBoxAdapter(
          child: Center(
            child: Text(error.toString()),
          ),
        ),

        data: (favorites) {
          if (favorites.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text('No favorite movies'),
              ),
            );
          }

          return SliverGrid.builder(
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.65,
            ),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final item = favorites[index];
              if (item.movie == null) {
                return const SizedBox();
              }
              return CustomMovie(
                movie: item.movie!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailScreen(
                        movie: item.movie!,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}