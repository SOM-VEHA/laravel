// import 'package:get/state_manager.dart';
// import 'package:movie_app/models/movieModel.dart';
// import 'package:movie_app/services/SlideService.dart';
//
// import '../services/MovieService.dart';
//
// class MovieController extends GetxController {
//   var isLoading = true.obs;
//   var selectedCategory = "Now Playing".obs;
//   final categories = ["Now Playing", "Coming Soon", "Top Rated","Now Playing", "Coming Soon", "Top Rated"];
//   var movies = <MovieModel>[].obs;
//   @override
//   void onInit() {
//     fetchMovies();
//     super.onInit();
//   }
//   void fetchMovies() async {
//     isLoading.value = true;
//     movies.value = await MovieService.getMovies();
//     isLoading.value = false;
//   }
// }

import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:movie_app/conrollers/CategoryController.dart';
import 'package:movie_app/data/models/movieModel.dart';
import 'package:movie_app/data/models/slideModel.dart';
import 'package:movie_app/data/services/MovieService.dart';
import 'package:movie_app/data/services/SlideService.dart';
import '../data/models/categoriesModel.dart';
import '../data/services/HomeService.dart';

class MovieController extends GetxController {
  final categoryController=Get.find<CategoryController>();
  var isLoading = true.obs;
  var selectedCategory = "Now Playing".obs;
  var movies = <MovieModel>[].obs;
  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  void fetchMovies() async {
    try {
      isLoading.value = true;
      movies.value = await MovieService.getMovies();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  List<MovieModel> get movieFilter {
    if (categoryController.selectedCategoryId.value == 1) {
      return movies;
    } else {
      return movies.where((movie) => movie.categoryId == categoryController.selectedCategoryId.value).toList();
    }
  }
}
