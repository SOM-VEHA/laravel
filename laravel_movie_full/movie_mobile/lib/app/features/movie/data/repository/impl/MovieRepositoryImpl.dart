import 'package:dio/dio.dart';
import 'package:movie_mobile/app/features/movie/data/repository/MovieRepository.dart';
import '../../model/MovieModel.dart';

class MovieRepositoryImpl implements MovieRepository {
  final Dio dio;
  MovieRepositoryImpl(this.dio);
  @override
  Future<List<MovieModel>> getAll({int page = 1, int? categoryId}) async {
    final response = await dio.get(
      "http://10.0.2.2:8000/api/movies",
      queryParameters: {
        'page': page,
        if (categoryId != null) 'category_id': categoryId,
      },
    );
    final List data = response.data['data'];
    return data.map((json) => MovieModel.fromJson(json)).toList();
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await dio.get("http://10.0.2.2:8000/api/movies/popula");
    final List data = response.data['data'];
    return data.map((json) => MovieModel.fromJson(json)).toList();
  }

  @override
  Future<List<MovieModel>> getAction() async {
    final response = await dio.get("http://10.0.2.2:8000/api/movies/action");
    final List data = response.data['data'];
    return data.map((json) => MovieModel.fromJson(json)).toList();
  }

  @override
  Future<List<MovieModel>> getGhost() async {
    final response = await dio.get("http://10.0.2.2:8000/api/movies/ghost");
    final List data = response.data['data'];
    return data.map((json) => MovieModel.fromJson(json)).toList();
  }
}
