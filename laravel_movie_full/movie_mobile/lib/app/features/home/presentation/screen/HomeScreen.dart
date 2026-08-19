import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mobile/app/features/home/presentation/Widget/CustomPopular.dart';
import 'package:movie_mobile/app/features/home/presentation/Widget/CustomSearch.dart';
import '../../../../../widget/CustomSectionTitle.dart';
import '../Widget/CustomActionMovie.dart';
import '../Widget/CustomAppbar.dart';
import '../Widget/CustomBanner.dart';
import '../Widget/CustomGhostMovie.dart';
class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final radius = BorderRadius.circular(16);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          ///appbar
          CustomAppbar(),
          ///search
          CustomSearch(onTap: (){}),
          ///banner
          CustomBanner(),
          ///Popular
          CustomSectionTitle(title: 'Popular', onTap: () {  },),
          CustomPopular(),
          ///ghost
          CustomSectionTitle(title: 'Ghost', onTap: () {  },),
          CustomGhostMovie(),
          ///ghost
          // CustomSectionTitle(title: 'Action', onTap: () {  },),
          // CustomActionMovie(),
          // SliverPadding(
          //   padding: EdgeInsetsGeometry.only(left: 10, right: 10),
          //   sliver: Obx(
          //         () => SliverList.builder(
          //       itemCount: categoriesController.categories.length,
          //       itemBuilder: (context, index) {
          //         final item = categoriesController.categories[index];
          //         return Container(
          //           // margin: EdgeInsets.only(bottom: 14),
          //           // padding: EdgeInsets.all(10),
          //           child: Column(
          //             children: [
          //               Padding(
          //                 padding: const EdgeInsets.only(top: 10, bottom: 10),
          //                 child: Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     Text(
          //                       item.name,
          //                       style: TextStyle(
          //                         color: Colors.white,
          //                         fontSize: 18,
          //                         fontWeight: FontWeight.bold,
          //                       ),
          //                     ),
          //                     GestureDetector(
          //                       onTap: () => Get.to(MovieeScreen()),
          //                       child: const Text(
          //                         "See all",
          //                         style: TextStyle(
          //                           color: Colors.white,
          //                           fontSize: 14,
          //                           fontWeight: FontWeight.w500,
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: 200,
          //                 child: ListView.builder(
          //                   scrollDirection: Axis.horizontal,
          //                   itemCount: item.movies.length,
          //                   itemBuilder: (context, index) {
          //                     final movie = item.movies[index];
          //                     return SizedBox(
          //                       width: 150,
          //                       child: Container(
          //                         margin: const EdgeInsets.only(right: 10),
          //                         child: CustomMovie(movie: movie,onTap: ()=>Get.to(MovieDetailScreen(movie: movie,controller: favoriteController)),favoriteController: favoriteController),
          //                       ),
          //                     );
          //                   },
          //                 ),
          //               ),
          //             ],
          //           ),
          //         );
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}