// import 'package:flutter/material.dart';
// import 'package:movie_mobile/app/features/home/presentation/screen/HomeScreen.dart';
//
// import 'app/features/auth/screen/SignInScree.dart';
// void main() {
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // initialRoute: TokenStorage.getToken()==""? AppRoutes.LOGIN : AppRoutes.App,
//       // getPages: AppPages.pages,
//       home:HomeScreen(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/features/AppScreen.dart';
import 'app/features/home/presentation/screen/HomeScreen.dart';


void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppScreen(),
    );
  }
}