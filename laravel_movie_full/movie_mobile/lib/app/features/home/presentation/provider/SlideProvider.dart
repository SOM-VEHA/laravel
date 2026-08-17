import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:movie_mobile/app/features/home/data/model/slide.dart';
import 'package:movie_mobile/app/features/home/data/repository/SlideRepository.dart';
import 'package:movie_mobile/app/features/home/data/repository/impl/SlideRepositoryImpl.dart';
final dioProvider = Provider<Dio>((ref)=>Dio());
final slideRepositoryProvider = Provider<SlideRepository>((ref)=>SlideRepositoryImpl(ref.watch(dioProvider)));
final slidesProvider = FutureProvider<List<SlideModel>>((ref) async =>ref.watch(slideRepositoryProvider).getAll());