import 'package:flutter/material.dart';
import '../../data/model/MovieModel.dart';

class MovieDetailScreen extends StatelessWidget {
  MovieDetailScreen({super.key, required this.movie,
    // required this.controller
  });
  final MovieModel movie;
  // final FavoriteController controller;
  // final controller = Get.put(MovieController());
  //
  // final movie = {
  //   "title": "Dune: Part Two",
  //   "genre": "Sci-Fi, Adventure",
  //   "duration": "2h 46m",
  //   "rating": "4.8",
  //   "image": "https://image.tmdb.org/t/p/w500/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg",
  //   "description":
  //       "Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.",
  // };
  //
  // final cast = [
  //   {
  //     "name": "Timothée Chalamet",
  //     "image": "https://randomuser.me/api/portraits/men/1.jpg",
  //   },
  //   {
  //     "name": "Zendaya",
  //     "image": "https://randomuser.me/api/portraits/women/2.jpg",
  //   },
  //   {
  //     "name": "Rebecca Ferguson",
  //     "image": "https://randomuser.me/api/portraits/women/3.jpg",
  //   },
  //   {
  //     "name": "Josh Brolin",
  //     "image": "https://randomuser.me/api/portraits/men/4.jpg",
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // ✅ FIX

      body: CustomScrollView(
        slivers: [
          ///appbar
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Colors.black,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                onPressed: () {
                  // controller.toggleFavorite(movie.id);
                },
                icon: Icon(
                  Icons.favorite,
                  size: 20,
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    "https://image.tmdb.org/t/p/w500/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg",
                    fit: BoxFit.cover,
                  ),

                  // 🔥 Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black, Colors.transparent],
                      ),
                    ),
                  ),

                  // ▶️ Play Button
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        // print("Play movie");
                        // Get.to(VideoScreen(videoUrl: 'http://172.20.10.9:8000/storage/video/movie2.MOV',));
                      },
                      child: Container(
                        padding: EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // flexibleSpace: FlexibleSpaceBar(
            //   background: Stack(
            //     fit: StackFit.expand,
            //     children: [
            //       Image.network("https://image.tmdb.org/t/p/w500/8b8R8l88Qje9dn9OE8PY05Nxl1X.jpg", fit: BoxFit.cover),
            //
            //       // 🔥 Gradient overlay
            //       Container(
            //         decoration: BoxDecoration(
            //           gradient: LinearGradient(
            //             begin: Alignment.bottomCenter,
            //             end: Alignment.topCenter,
            //             colors: [Colors.black, Colors.transparent],
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ),

          ///📄 CONTENT
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Text(
                    movie.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    // "${movie["genre"]} • ${movie["duration"]}",
                    "dsfsdf",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 4),
                      Text(
                        movie.rating.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  /// About
                  Text(
                    "About",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    movie.description,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 20),

                  /// Cast
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cast",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("See All", style: TextStyle(color: Colors.red)),
                    ],
                  ),
                  SizedBox(height: 10),
                  // SizedBox(
                  //   height: 80,
                  //   child: ListView(
                  //     scrollDirection: Axis.horizontal,
                  //     children: cast.map((actor) {
                  //       return Container(
                  //         margin: EdgeInsets.only(right: 12),
                  //         child: Column(
                  //           children: [
                  //             CircleAvatar(
                  //               radius: 25,
                  //               backgroundImage: NetworkImage(actor["image"]!),
                  //             ),
                  //             SizedBox(height: 6),
                  //             Text(
                  //               actor["name"]!,
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 10,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       );
                  //     }).toList(),
                  //   ),
                  // ),
                  SizedBox(height: 25),

                  /// 🎟 Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(
                        "Select Showtimes",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
