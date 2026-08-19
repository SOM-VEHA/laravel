import 'package:movie_mobile/app/features/movie/data/model/MovieModel.dart';
abstract interface class MovieRepository {
  Future<List<MovieModel>> getAll({int page = 1, int? categoryId});
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getAction();
  Future<List<MovieModel>> getGhost();
}