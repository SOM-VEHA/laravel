import 'package:flutter/material.dart';
class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  // final favorite_controller = Get.find<FavoriteController>();
  @override
  void initState() {
    // favorite_controller.fetchFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text.rich(
//           TextSpan(
//             text: 'Favorites',
//             style: TextStyle(
//               fontWeight: FontWeight.w900,
//               fontSize: 22,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Obx(() {
//           if (favorite_controller.validFavorites.isEmpty) {
//             return const Center(child: Text("No favorites yet"));
//           } else {
//             return ListView.builder(itemCount: favorite_controller.validFavorites.length,itemBuilder: (context, index) {
//               final movie=favorite_controller.validFavorites[index].movie!;
//               return InkWell(
//                 onTap: (){
//                   Get.to(MovieDetailScreen(movie: movie, controller: favorite_controller));
//                 },
//                 child: Container(
//                   margin: EdgeInsets.only(bottom: 14),
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[900],
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Row(
//                     children: [
// // Poster
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(10),
//                         child: Image.network(
//                           "https://image.tmdb.org/t/p/w500/2zmTngn1tYC1AvfnrFLhxeD82hz.jpg",
//                           width: 80,
//                           height: 100,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//
//                       SizedBox(width: 12),
//
// // Info
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment:
//                           CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               movie.title,
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             SizedBox(height: 6),
//                             Text(
//                               movie.description.toString(),
//                               style: TextStyle(color: Colors.grey),
//                             ),
//                             SizedBox(height: 6),
//                             Row(
//                               children: [
//                                 Icon(Icons.star, color: Colors.amber, size: 16),
//                                 SizedBox(width: 4),
//                                 Text(
//                                   "", style: TextStyle(color: Colors.white),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//
//                       InkWell(
//                         onTap:()=>favorite_controller.toggleFavorite(movie.id),
//                         child: Icon(Icons.bookmark_border, color: Colors.white),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             },);
//           }
//         }),
//       ),
    );
  }
}
