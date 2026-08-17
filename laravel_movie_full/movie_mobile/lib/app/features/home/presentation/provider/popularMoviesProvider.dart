import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mobile/app/features/movie/presentation/provider/MovieProvider.dart';
import '../../../movie/data/model/MovieModel.dart';
final popularMoviesProvider = FutureProvider<List<MovieModel>>((ref)=>ref.watch(movieRepositoryProvider).getPopula());