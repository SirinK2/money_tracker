import 'package:get/get.dart';
import 'package:money_tracker/logic/controllers/balance_controller.dart';
import 'package:money_tracker/logic/controllers/onboarding_controller.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingController());
    Get.put(BalanceController(), permanent: true);
  }

}