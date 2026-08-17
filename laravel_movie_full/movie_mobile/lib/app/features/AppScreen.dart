import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/constanst/app_color.dart';
import 'appController.dart';
class AppScreen extends ConsumerWidget {
  const AppScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch state updates from Riverpod controller
    final appState = ref.watch(appControllerProvider);
    final appNotifier = ref.read(appControllerProvider.notifier);

    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: IndexedStack(
          index: appState.selectedIndex,
          children: appState.screens,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.background,
        currentIndex: appState.selectedIndex,
        onTap: (index) => appNotifier.setIndex(index),

        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.window_sharp),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined),
            label: "Movies",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "Account",
          ),
        ],
      ),
    );
  }
}