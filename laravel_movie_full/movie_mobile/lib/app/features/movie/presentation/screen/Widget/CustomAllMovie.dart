import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mobile/app/features/movie/presentation/provider/movieProvider.dart';

import '../MovieDetailScreen.dart';
import 'CustomMovie.dart';
class CustomAllMovie extends ConsumerWidget {
  const CustomAllMovie({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(movieProvider);
    return SliverPadding(
      padding: EdgeInsetsGeometry.all(10),
      sliver:SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
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
      ),
    );
  }
}
