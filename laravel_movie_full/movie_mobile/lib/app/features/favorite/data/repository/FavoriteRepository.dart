import 'package:movie_mobile/app/features/favorite/data/model/FavoriteModel.dart';

abstract interface class FavoriteRepository{
  Future<List<FavoriteModel>> getAll();
}