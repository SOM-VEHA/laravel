import 'package:get/get.dart';
import 'package:movie_app/modules/app/AppController.dart';
import 'package:movie_app/modules/app/AppScreen.dart';
import '../../modules/app/AppBinding.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.App,
      page: () => AppScreen(),
      binding: AppBinding(),
    ),
  ];
}