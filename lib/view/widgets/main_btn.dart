import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/utils/app_colors.dart';
import 'package:money_tracker/view/widgets/text_util.dart';

class MainBtn extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const MainBtn({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width - 40,
        height: 50,
        decoration: BoxDecoration(
            ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.mainColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: TextUtil(
            text: text,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
        ));
  }
}
