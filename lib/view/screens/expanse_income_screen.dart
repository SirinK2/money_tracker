import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/utils/app_colors.dart';

class ExpenseIncomeScreen extends StatelessWidget {
  const ExpenseIncomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments == 1 ? "Expense" : "Income"),
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        elevation: 0,

      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        color: Get.arguments == 1 ? Colors.red : Colors.green,
      ),
    );
  }
}
