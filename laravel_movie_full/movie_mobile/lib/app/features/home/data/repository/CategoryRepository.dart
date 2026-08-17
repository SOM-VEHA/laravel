import 'package:movie_mobile/app/features/home/data/model/category.dart';

abstract interface class CategoryRepository{
  Future<List<CategoryModel>> getAll();
}