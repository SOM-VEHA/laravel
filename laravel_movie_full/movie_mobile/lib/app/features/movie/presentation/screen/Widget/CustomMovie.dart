import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_mobile/app/features/movie/data/model/MovieModel.dart';
class CustomMovie extends StatelessWidget {
  CustomMovie({super.key,required this.movie, required this.onTap,
    // required this.favoriteController
  });
  final MovieModel movie;
  final VoidCallback onTap;
  // final FavoriteController favoriteController;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFF1C1C1C),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE
            Expanded(
              child:  Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8),),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 170,
                      imageUrl:"https://image.tmdb.org/t/p/w500/2zmTngn1tYC1AvfnrFLhxeD82hz.jpg",
                    ),
                  ),
                  // Favorite
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                          onTap: (){},
                          child: Icon(
                            Icons.favorite,
                            size: 16,
                          ),






                        // onTap: ()=>favoriteController.toggleFavorite(movie.id),
                        // child: Obx((){
                        //   final isFav = favoriteController.isFavorite(movie.id);
                        //   return Icon(
                        //     isFav ? Icons.favorite : Icons.favorite_border,
                        //     color: isFav ? Colors.red : Colors.grey,
                        //     size: 16,
                        //   );
                        // })
                      ),
                    ),
                  ),
                  // NEW badge
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "NEW",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // TITLE
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    movie.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  // SizedBox(height: 6),
                  // Text(
                  //   movie.description,
                  //   maxLines: 3,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: TextStyle(
                  //     color: Colors.grey,
                  //     fontSize: 12,
                  //     height: 1.3,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}