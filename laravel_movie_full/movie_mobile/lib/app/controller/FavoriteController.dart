import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:movie_app/data/models/favoriteModel.dart';
import 'package:movie_app/data/services/FavoriteService.dart';
class FavoriteController extends GetxController{
  var favorites = <FavoriteModel>[].obs;
  var isLoading = false.obs;
  bool isFavorite(int productId) {
    return favorites.any((e) => e.movie_id == productId);
  }
  @override
  void onInit() {
    fetchFavorites();
    super.onInit();
  }

  void fetchFavorites() async {
    isLoading.value = true;
    favorites.value = await FavoriteService.getFavorites();
    isLoading.value = false;
  }

  void removeFavorite(int productId)async{
    await FavoriteService.removeFavorite(productId);
  }

  void addFavorite(int productId)async{
    await FavoriteService.addFavorite(productId);
  }

  List<FavoriteModel> get validFavorites {
    return favorites.where((p) => p.movie !=null).toList();
  }

  Future<void> toggleFavorite(int productId) async {
    final exists = favorites.any((e) => e.movie_id == productId);

    if (exists) {
      favorites.removeWhere((e) => e.movie_id == productId);
      // TODO: call API remove
      removeFavorite(productId);
    } else {
      addFavorite(productId);
      favorites.add(
        FavoriteModel(
          id: 0,
          user_id: 0,
          movie_id: productId,
        ),
      );
    }
  }
}