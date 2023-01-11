import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/route/route.dart';
import 'package:money_tracker/utils/app_images.dart';

import '../../model/onboarding_model.dart';

class OnBoardingController extends GetxController{

  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;
  var pageController = PageController();

  forwardAction(){
    if(isLastPage){
      Get.offAllNamed(Routes.homeScreen);

    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }


  List<OnBoardingModel> onBoardingPages = [
    OnBoardingModel(
      AppImages.welcome,
      "Say hi to your new finance tracker",
      "You're amazing for taking this first step towards getting better control over your money and financial goals.",
    ),
    OnBoardingModel(
      AppImages.piggyBank,
      "Control your spend and start saving",
      "Monefy helps you control your spending, track your expenses, and ultimately save more money.",
    ),
    OnBoardingModel(
      AppImages.goal,
      "Together we'll reach your financial goals",
      "If you fail to plan, you plan to fail. Monefy will help you stay focused on tracking your spend and reach your financial goals.",
    ),


  ];
}
