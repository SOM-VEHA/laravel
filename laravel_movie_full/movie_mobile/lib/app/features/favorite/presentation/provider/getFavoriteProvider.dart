import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mobile/app/features/favorite/data/model/FavoriteModel.dart';
import 'package:movie_mobile/app/features/favorite/presentation/provider/base/provider.dart';
final getFavoriteProvider = FutureProvider<List<FavoriteModel>>((ref) async =>ref.watch(favoriteRepositoryProvider).getAll());