import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../movie/presentation/screen/MovieDetailScreen.dart';
import '../../../movie/presentation/screen/Widget/CustomMovie.dart';
import 'package:movie_mobile/app/features/movie/presentation/provider/moviePopularProvider.dart';
class CustomPopular extends ConsumerWidget {
  const CustomPopular({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(popularMoviesProvider);
    return SliverPadding(
      padding: EdgeInsetsGeometry.all(10),
      sliver: movies.when(
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
        data: (movies) {
          return SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              height: 230,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Container(
                    margin: const EdgeInsets.only(right: 15),
                    width: 150,
                    child: CustomMovie(
                      movie: movie,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MovieDetailScreen(movie: movie),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
