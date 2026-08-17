import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:movie_mobile/app/features/movie/data/model/MovieModel.dart';
import 'package:movie_mobile/app/features/movie/data/repository/MovieRepository.dart';
import 'package:movie_mobile/app/features/movie/data/repository/impl/MovieRepositoryImpl.dart';
final dioProvider = Provider<Dio>((ref)=>Dio());
final movieRepositoryProvider = Provider<MovieRepository>((ref)=>MovieRepositoryImpl(ref.watch(dioProvider)));
final movieProvider = FutureProvider<List<MovieModel>>((ref) async =>ref.watch(movieRepositoryProvider).getAll());