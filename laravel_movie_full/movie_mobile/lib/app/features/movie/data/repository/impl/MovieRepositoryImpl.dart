import 'package:dio/dio.dart';
import 'package:movie_mobile/app/features/movie/data/repository/MovieRepository.dart';
import '../../model/MovieModel.dart';
class MovieRepositoryImpl implements MovieRepository{
  final Dio dio;
  MovieRepositoryImpl(this.dio);
  @override
  Future<List<MovieModel>> getAll()async {
    final response = await dio.get("http://10.0.2.2:8000/api/movies");
    final List data = response.data['data'];
    return data.map((json) => MovieModel.fromJson(json)).toList();
  }

  @override
  Future<List<MovieModel>> getPopula()async {
    final response = await dio.get("http://10.0.2.2:8000/api/movies/popula");
    final List data = response.data['data'];
    return data.map((json) => MovieModel.fromJson(json)).toList();
  }
}