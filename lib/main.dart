import 'package:complex_data_management/auth/user_auth.dart';
import 'package:complex_data_management/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}

Widget logout(BuildContext context) {
  return IconButton(
    onPressed: () {
      UserAuth.isLoggedIn = false;
      context.go('/login');
    },
    icon: Icon(Icons.logout),
  );
}
