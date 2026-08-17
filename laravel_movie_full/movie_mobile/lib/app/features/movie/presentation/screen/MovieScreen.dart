import 'package:flutter/material.dart';
import '../../../home/presentation/Widget/CustomAppbar.dart';
import 'Widget/CustomAllMovie.dart';
import 'Widget/CustomCategory.dart';
class MovieScreen extends StatelessWidget {
  MovieScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          CustomAppbar(),
          CustomCategory(),
          CustomAllMovie(),
        ],
      ),
    );
  }
}


