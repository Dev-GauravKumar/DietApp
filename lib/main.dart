import 'package:diet_app/constants/color_consts.dart';
import 'package:diet_app/route/routes.dart';
import 'package:diet_app/screens/auth_screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              backgroundColor: AppColors.loginPageBgColor,
              dialogBackgroundColor: AppColors.searchBoxBgColor,
            ),
            home: const LoginPage(),
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        });
  }
}
