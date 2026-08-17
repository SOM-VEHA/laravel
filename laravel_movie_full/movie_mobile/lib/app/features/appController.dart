import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mobile/app/features/profile/ProfileScreen.dart';
import 'favorite/FavoriteScreen.dart';
import 'home/presentation/screen/HomeScreen.dart';
import 'movie/presentation/screen/MovieScreen.dart';

// State model to hold screen navigation state
class AppState {
  final int selectedIndex;
  final List<Widget> screens;

  AppState({
    required this.selectedIndex,
    required this.screens,
  });

  AppState copyWith({int? selectedIndex, List<Widget>? screens}) {
    return AppState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      screens: screens ?? this.screens,
    );
  }
}

// Notifier class to handle navigation state logic
class AppNotifier extends Notifier<AppState> {
  @override
  AppState build() {
    return AppState(
      selectedIndex: 0,
      screens: [
        HomeScreen(),
        MovieScreen(), // Replace with MovieScreen()
        FavoriteScreen(), // Replace with FavoriteScreen()
        ProfileScreen(), // Replace with ProfileScreen()
      ],
    );
  }

  void setIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }
}

// Global Riverpod provider access point
final appControllerProvider = NotifierProvider<AppNotifier, AppState>(
  AppNotifier.new,
);