import 'dart:developer';

import 'package:get/get.dart';
import 'package:movie_app/data/models/slideModel.dart';
import 'package:movie_app/data/services/HomeService.dart';
import 'package:movie_app/data/services/SlideService.dart';
class SlideController extends GetxController{
  var slides = <SlideModel>[].obs;
  var isLoading = false.obs;
  var currentIndex = 0;
  @override
  void onInit() {
    fetchSlides();
    super.onInit();
  }
  void fetchSlides() async {
    isLoading.value = true;
    slides.value = await SlideService.getSlides();
    isLoading.value = false;
  }
}
