import 'package:get/get.dart';
import 'package:money_tracker/logic/bindings/home_binding.dart';
import 'package:money_tracker/view/screens/expanse_income_screen.dart';
import 'package:money_tracker/view/screens/homepage_screen.dart';
import 'package:money_tracker/view/screens/onboarding_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.onBoardingScreen,
      page: () => OnBoardingScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomePageScreen(),
      binding: HomeBinding()
    ),
    GetPage(
      name: Routes.expenseIncomeScreen,
      page: () => const ExpenseIncomeScreen(),

    ),

  ];
}

class Routes {
  static const onBoardingScreen = '/onBoardingScreen';
  static const homeScreen = '/homeScreen';
  static const expenseIncomeScreen = '/expenseIncomeScreen';
}
