import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mobile/app/features/home/data/model/category.dart';
import 'package:movie_mobile/app/features/home/data/repository/CategoryRepository.dart';
import 'package:movie_mobile/app/features/home/data/repository/impl/CategoryRepositoryImpl.dart';
final dioProvider = Provider<Dio>((ref)=>Dio());
final categoryRepositoryProvider = Provider<CategoryRepository>((ref)=>CategoryRepositoryImpl(ref.watch(dioProvider)));
final categoryProvider = FutureProvider<List<CategoryModel>>((ref) async =>ref.watch(categoryRepositoryProvider).getAll());
final selectedCategoryIdProvider = StateProvider<int?>((ref) => null);