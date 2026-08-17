import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../movie/MovieScreen.dart';
class CustomSectionTitle extends StatelessWidget {
  const CustomSectionTitle({super.key, required this.title,required this.onTap});
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(padding: EdgeInsetsGeometry.all(10),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: ()=>Get.to(MovieeScreen()),
              child: const Text(
                "See all",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
