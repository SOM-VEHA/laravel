import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mobile/app/features/movie/data/model/MovieModel.dart';
import 'package:movie_mobile/app/features/movie/presentation/provider/base/provider.dart';
final movieActionProvider = FutureProvider<List<MovieModel>>((ref) async =>ref.watch(movieRepositoryProvider).getAction());