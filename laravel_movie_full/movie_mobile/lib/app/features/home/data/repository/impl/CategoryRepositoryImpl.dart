import 'package:dio/dio.dart';
import 'package:movie_mobile/app/features/home/data/model/category.dart';
import '../../../../../core/constanst/api_constants.dart';
import '../CategoryRepository.dart';
class CategoryRepositoryImpl implements CategoryRepository{

  final Dio dio;

  CategoryRepositoryImpl(this.dio);

  @override
  Future<List<CategoryModel>> getAll()async {
    final response = await dio.get("http://10.0.2.2:8000/api/categories");
    final List data = response.data['data'];
    print("categoryyyyyy : ${data}");
    return data.map((toElement)=>CategoryModel.fromJson(toElement)).toList();
  }
}