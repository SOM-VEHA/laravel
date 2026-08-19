import 'package:dio/dio.dart';
import 'package:movie_mobile/app/core/storage/token_storage.dart';
import 'package:movie_mobile/app/features/favorite/data/model/FavoriteModel.dart';
import 'package:movie_mobile/app/features/favorite/data/repository/FavoriteRepository.dart';
import 'package:movie_mobile/app/network/api_exception.dart';

class FavoriteRepositoryImpl implements FavoriteRepository{
  final Dio dio;
  final TokenStorage tokenStorage;
  FavoriteRepositoryImpl(this.dio,this.tokenStorage);
  @override
  Future<List<FavoriteModel>> getAll() async{
    final token = await tokenStorage.getToken();
    print("token : ${token}");
    if (token == null || token.isEmpty) {
      throw ApiException(
        message: 'You must login first',
      );
    }
    final response = await dio.get(
      'http://10.0.2.2:8000/api/favorites',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      ),
    );
    final List data = response.data['data'];
    print("favorite : ${data}");
    return data.map((toElement)=>FavoriteModel.fromJson(toElement)).toList();
  }
}