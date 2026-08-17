import 'package:get/get.dart';
import '../data/models/categoriesModel.dart';
import '../data/services/CategoryService.dart';

class CategoryController extends GetxController {
  var categories = <CategoryModel>[].obs;
  var isLoading = false.obs;
  final RxInt selectedCategoryId = 1.obs;
  @override
  void onInit() {
    fetchCatgories();
    super.onInit();
  }

  void fetchCatgories() async {
    try {
      isLoading.value = true;
      categories.value = await CategoryService.getCategories();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
