import 'package:diet_app/screens/auth_screens/forgot_password_page.dart';
import 'package:diet_app/screens/auth_screens/login_page.dart';
import 'package:diet_app/screens/auth_screens/signup_page.dart';
import 'package:diet_app/screens/home_page.dart';
import 'package:flutter/material.dart';

import '../screens/chat_screens/chat_box_screen.dart';

abstract class RouteGenerator {
  static const String loginPage = '/login';
  static const String signUpPage = '/signUp';
  static const String forgotPasswordPage = '/forgotPassword';
  static const String homePage = '/homePage';
  static const String chatBoxScreen = '/chatBoxScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    Object? args = settings.arguments;
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case signUpPage:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case forgotPasswordPage:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case chatBoxScreen:
        return MaterialPageRoute(
            builder: (_) => ChatBoxScreen(
                  name: args.toString(),
                ));
      default:
        throw const RouteException("Route not found");
    }
  }
}

class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}
