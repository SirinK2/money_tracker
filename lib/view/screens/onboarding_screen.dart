import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/logic/controllers/onboarding_controller.dart';
import 'package:money_tracker/utils/app_colors.dart';
import 'package:money_tracker/view/widgets/onboarding/green_clipper.dart';
import 'package:money_tracker/view/widgets/text_util.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  final _controller = Get.find<OnBoardingController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.selectedPageIndex,
              itemCount: _controller.onBoardingPages.length,
              itemBuilder: (_, index) {
                var data = _controller.onBoardingPages[index];
                return Stack(
                  children: [
                   ClipPath(
                     clipper: GreenClipper(),
                     child: Container(
                       color: AppColors.mainColor,
                     ),
                   ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Image.asset(data.imageAsset),
                        const SizedBox(
                          height: 32,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: TextUtil(
                            text: data.title,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainColor,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: TextUtil(
                            text: data.description,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.shade700,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }),
          Positioned(
            bottom: 50,
            child: SizedBox(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: List.generate(
                      _controller.onBoardingPages.length,
                      (index) => Obx(
                        () => Container(
                          margin: const EdgeInsets.all(4),
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                              color: _controller.selectedPageIndex.value == index
                                  ? AppColors.mainColor
                                  : Colors.grey.shade300,
                              shape: BoxShape.circle),
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    elevation: 0,
                    onPressed: () async {
                      await _controller.forwardAction();
                    },
                    child: Obx(() => TextUtil(
                      text: _controller.isLastPage ? "Start": "Next",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainColor,
                      textAlign: TextAlign.center,
                    )),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
