import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/MovieModel.dart';
import '../base/provider.dart';

class MovieNotifier extends Notifier<List<MovieModel>> {
  int page = 1;
  int? categoryId;

  bool hasMore = true;
  bool isLoadingMore = false;

  // Cache movies by category
  final Map<int?, List<MovieModel>> cache = {};

  // Cache page by category
  final Map<int?, int> pageCache = {};

  @override
  List<MovieModel> build() {
    Future.microtask(() => loadMovies());
    return [];
  }

  Future<void> loadMovies({int? categoryId}) async {
    this.categoryId = categoryId;

    // ✅ Already loaded before
    if (cache.containsKey(categoryId)) {
      state = cache[categoryId]!;

      page = pageCache[categoryId] ?? 1;

      return;
    }

    // First time loading this category
    page = 1;
    hasMore = true;

    final movies = await ref
        .read(movieRepositoryProvider)
        .getAll(page: page, categoryId: categoryId);

    // Save cache
    cache[categoryId] = movies;
    pageCache[categoryId] = page;

    state = movies;
  }

  Future<void> loadMore() async {
    if (isLoadingMore || !hasMore) return;

    isLoadingMore = true;

    final nextPage = page + 1;

    final movies = await ref
        .read(movieRepositoryProvider)
        .getAll(page: nextPage, categoryId: categoryId);

    if (movies.isEmpty) {
      hasMore = false;
    } else {
      page = nextPage;

      state = [...state, ...movies];

      // ✅ Update cache
      cache[categoryId] = state;
      pageCache[categoryId] = page;
    }

    isLoadingMore = false;
  }
}
