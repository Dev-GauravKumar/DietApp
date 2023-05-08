import 'package:diet_app/screens/auth_screens/forgot_password_page.dart';
import 'package:diet_app/screens/auth_screens/login_page.dart';
import 'package:diet_app/screens/auth_screens/signup_page.dart';
import 'package:diet_app/screens/diet_ideas_screens/diet_idea_screen.dart';
import 'package:diet_app/screens/feedback_screens/add_feedback_screen.dart';
import 'package:diet_app/screens/feedback_screens/feedbacks_screen.dart';
import 'package:diet_app/screens/home_page.dart';
import 'package:diet_app/screens/home_page_card_screens/my_diet_program_screen1.dart';
import 'package:diet_app/screens/home_page_card_screens/my_diet_program_screen2.dart';
import 'package:diet_app/screens/schedule_screens/appointment_booking_screen.dart';
import 'package:diet_app/screens/settings_screens/dietitian.dart';
import 'package:diet_app/screens/settings_screens/my_account_screen.dart';
import 'package:diet_app/screens/settings_screens/receipts_screen.dart';
import 'package:diet_app/screens/settings_screens/service_programme_screen.dart';
import 'package:diet_app/screens/tracker_screens/add_meal_screen.dart';
import 'package:diet_app/screens/tracker_screens/meals_plan_page.dart';
import 'package:diet_app/screens/tracker_screens/meals_screen.dart';
import 'package:diet_app/screens/tracker_screens/new_weight_screen.dart';
import 'package:diet_app/screens/tracker_screens/weight_tracker_screen.dart';
import 'package:flutter/material.dart';

import '../screens/chat_screens/chat_box_screen.dart';

abstract class RouteGenerator {
  static const String loginPage = '/login';
  static const String signUpPage = '/signUp';
  static const String forgotPasswordPage = '/forgotPassword';
  static const String homePage = '/homePage';
  static const String chatBoxScreen = '/chatBoxScreen';
  static const String myAccountScreen = '/myAccountScreen';
  static const String serviceProgrammeScreen = '/serviceProgrammeScreen';
  static const String receiptsScreen = '/receiptsScreen';
  static const String dietitianBioScreen = '/dietitianBioScreen';
  static const String appointmentBookingScreen = '/appointmentBookingScreen';
  static const String myDietProgramScreen = '/myDietProgramScreen';
  static const String dietIdeasScreen = '/dietIdeasScreen';
  static const String addFeedbackScreen = '/addFeedbackScreen';
  static const String feedbacksScreen = '/feedbacksScreen';
  static const String mealsScreen = '/mealsScreen';
  static const String mealsPlanPage = '/mealsPlanPage';
  static const String addMealScreen = '/addMealScreen';
  static const String weightTrackerScreen = '/weightTrackerScreen';
  static const String newWeightScreen = '/newWeightScreen';

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
      case serviceProgrammeScreen:
        return MaterialPageRoute(
            builder: (_) => const ServiceProgrammeScreen());
      case receiptsScreen:
        return MaterialPageRoute(builder: (_) => const ReceiptsScreen());
      case dietitianBioScreen:
        return MaterialPageRoute(builder: (_) => const DietitianBio());
      case appointmentBookingScreen:
        return MaterialPageRoute(
            builder: (_) => const AppointmentBookingScreen());
      case chatBoxScreen:
        return MaterialPageRoute(
            builder: (_) => ChatBoxScreen(
                  name: args.toString(),
                ));
      case myAccountScreen:
        return MaterialPageRoute(builder: (_) => const MyAccountScreen());
      case myDietProgramScreen:
        return MaterialPageRoute(builder: (_) => const DietProgramScreen2());
      case dietIdeasScreen:
        return MaterialPageRoute(builder: (_) => const DietIdeaScreen());
      case addFeedbackScreen:
        return MaterialPageRoute(builder: (_) => const AddFeedbackScreen());
      case feedbacksScreen:
        return MaterialPageRoute(builder: (_) => const FeedbacksScreen());
      case mealsPlanPage:
        return MaterialPageRoute(builder: (_) => const MealPlanPage());
      case addMealScreen:
        return MaterialPageRoute(builder: (_) => const AddMealScreen());
      case weightTrackerScreen:
        return MaterialPageRoute(builder: (_) => const WeightTrackerScreen());
      case newWeightScreen:
        return MaterialPageRoute(builder: (_) => const NewWeightScreen());
      case mealsScreen:
        return MaterialPageRoute(
            builder: (_) => MealsScreen(kcal: int.parse(args.toString())));
      default:
        throw const RouteException("Route not found");
    }
  }
}

class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}
