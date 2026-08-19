import 'package:dio/dio.dart';
import 'package:movie_mobile/app/core/constanst/api_constants.dart';
import 'package:movie_mobile/app/features/home/data/model/slide.dart';
import '../SlideRepository.dart';
class SlideRepositoryImpl implements SlideRepository{

  final Dio dio;

  SlideRepositoryImpl(this.dio);

  @override
  Future<List<SlideModel>> getAll() async{
    // final response = await dio.get(ApiConstants.slides);
    final response = await dio.get("http://10.0.2.2:8000/api/slides");
    final List data = response.data['data'];
    return data.map((json) => SlideModel.fromJson(json)).toList();
  }
}