import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:movie_mobile/app/core/storage/token_storage.dart';
import 'package:movie_mobile/app/features/favorite/data/repository/FavoriteRepository.dart';
import 'package:movie_mobile/app/features/favorite/data/repository/impl/FavoriteRepositoryImpl.dart';
final dioProvider = Provider<Dio>((ref) {
  return Dio();
});
final favoriteRepositoryProvider = Provider<FavoriteRepository>((ref) {
  return FavoriteRepositoryImpl(
    ref.watch(dioProvider),
    ref.watch(tokenStorageProvider),
  );
});