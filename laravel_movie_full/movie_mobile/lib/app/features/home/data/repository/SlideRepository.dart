import 'package:movie_mobile/app/features/home/data/model/slide.dart';

abstract interface class SlideRepository{
  Future<List<SlideModel>> getAll();
}