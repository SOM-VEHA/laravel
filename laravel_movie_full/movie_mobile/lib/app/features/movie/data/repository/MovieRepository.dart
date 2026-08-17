import 'package:movie_mobile/app/features/movie/data/model/MovieModel.dart';
abstract interface class MovieRepository {
  Future<List<MovieModel>> getAll();
  Future<List<MovieModel>> getPopula();
}