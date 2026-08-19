import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mobile/app/features/auth/presentation/screen/SignInScreen.dart';
import 'app/core/storage/token_storage.dart';
import 'app/features/AppScreen.dart';
void main() {
  runApp(const ProviderScope(child: MyApp()));
}
class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokenStorage = ref.read(tokenStorageProvider);
    return FutureBuilder<String?>(
      future: tokenStorage.getToken(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }
        final token = snapshot.data;
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: token != null && token.isNotEmpty ? const AppScreen() : SignInScreen(),
        );
      },
    );
  }
}
