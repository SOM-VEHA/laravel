import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mobile/app/features/movie/data/model/MovieModel.dart';
import 'package:movie_mobile/app/features/movie/presentation/provider/base/provider.dart';

import '../../../home/presentation/provider/CategoryProvider.dart';
import 'Notifier/MovieNotifier.dart';
// final movieProvider = FutureProvider<List<MovieModel>>((ref) async =>ref.watch(movieRepositoryProvider).getAll());
// final movieProvider = FutureProvider((ref) async {
//   final categoryId = ref.watch(selectedCategoryIdProvider);
//   return ref.read(movieRepositoryProvider).getAll(
//     categoryId: categoryId,
//     page: 1,
//   );
// });
final movieProvider =
NotifierProvider<MovieNotifier, List<MovieModel>>(
  MovieNotifier.new,
);