import 'package:movie_mobile/app/features/movie/data/model/MovieModel.dart';

class FavoriteModel {
  final int id;
  final int userId;
  final int movieId;
  final MovieModel? movie;
  FavoriteModel({
    required this.id,
    required this.userId,
    required this.movieId,
    this.movie,
  });
  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'],
      userId: json['user_id'],
      movieId: json['movie_id'],
      movie: json['movie'] != null ? MovieModel.fromJson(json['movie']) : null,
    );
  }
}
