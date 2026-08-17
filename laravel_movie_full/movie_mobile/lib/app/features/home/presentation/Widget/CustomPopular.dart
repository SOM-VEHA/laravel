import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../movie/presentation/screen/MovieDetailScreen.dart';
import '../../../movie/presentation/screen/Widget/CustomMovie.dart';
import '../provider/popularMoviesProvider.dart';
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
          return SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.65,
            ),
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie=movies[index];
              return CustomMovie(movie: movie, onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailScreen(
                      movie: movie,
                    ),
                  ),
                );
              },);
            },
          );
        },
      ),
    );
  }
}
