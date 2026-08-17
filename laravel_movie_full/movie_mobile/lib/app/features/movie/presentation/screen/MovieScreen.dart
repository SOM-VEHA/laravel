import 'package:flutter/material.dart';
import '../../../../../widget/CustomAppbar.dart';
class MovieScreen extends StatelessWidget {
  MovieScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          CustomAppbar(),
          // CustomCategory(),
          // CustomCategory(),
          //movie list
          // Movie(),
        ],
      ),
    );
  }
}


