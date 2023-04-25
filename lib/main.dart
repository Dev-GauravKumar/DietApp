import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/route/routes.dart';
import 'package:diet_app/screens/auth_screens/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: AppColors.loginPageBgColor,
      ),
      home: const LoginPage(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
