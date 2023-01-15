import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/route/route.dart';
import 'package:money_tracker/utils/app_colors.dart';
import 'package:money_tracker/view/screens/homepage_screen.dart';
import 'package:money_tracker/view/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Money tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      initialRoute: Routes.onBoardingScreen,
      getPages: AppRoutes.routes,
    );
  }
}

