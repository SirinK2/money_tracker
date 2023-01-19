import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../logic/controllers/balance_controller.dart';
import '../../../model/category_model.dart';
import '../categories/category_icon.dart';

class CategoryGridViewWidget extends StatelessWidget {
  const CategoryGridViewWidget({
    Key? key,
    required this.controller,
    required this.textController,
  }) : super(key: key);

  final BalanceController controller;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        itemCount: Get.arguments == 1
            ? controller.expenseCategoryList.length
            : controller.incomeCategoryList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1.5),
        itemBuilder: (_, index) {
          var data = Get.arguments == 1
              ? controller.expenseCategoryList[index]
              : controller.incomeCategoryList[index];

          return CategoryIcon(
            icon: data.icon,
            color: data.color,
            text: data.categoryName,
            onSelected: () {
              if (textController.text.isNotEmpty && textController.text.isNum) {
                controller.addData(Get.arguments == 1
                    ? Chart(
                        categoryName: data.categoryName,
                        amount: double.parse("-${textController.text.trim()}"),
                        color: data.color,
                        icon: data.icon,
                        id: const Uuid().v4(),
                        date: controller.date.isNotEmpty
                            ? controller.dateFormatStr
                            : controller.dateFormatNow,
                      )
                    : Chart(
                        categoryName: data.categoryName,
                        amount: double.parse(textController.text.trim()),
                        color: data.color,
                        icon: data.icon,
                        id: const Uuid().v4(),
                        date: controller.date.isNotEmpty
                            ? controller.dateFormatStr
                            : controller.dateFormatNow,
                      ));
                Get.arguments == 1
                    ? controller
                        .sumBalance(-double.parse(textController.text.trim()))
                    : controller
                        .sumBalance(double.parse(textController.text.trim()));

                Get.back();
              } else {
                Get.snackbar("Numbers only", "Please enter numbers only");
              }
            },
            containerSize: 65,
            iconSize: 50,
          );
        },
      ),
    );
  }
}
