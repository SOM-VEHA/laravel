import 'package:dio/dio.dart';
import 'package:movie_mobile/app/features/home/data/model/category.dart';
import '../../../../../core/constanst/api_constants.dart';
import '../CategoryRepository.dart';
class CategoryRepositoryImpl implements CategoryRepository{

  final Dio dio;

  CategoryRepositoryImpl(this.dio);

  @override
  Future<List<CategoryModel>> getAll()async {
    final response = await dio.get(ApiConstants.profile);
    final List data = response.data;
    return data.map((toElement)=>CategoryModel.fromJson(toElement)).toList();
  }
}