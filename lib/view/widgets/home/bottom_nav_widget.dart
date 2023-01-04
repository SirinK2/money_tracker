import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/route/route.dart';

import 'expense_income_btn.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 90,
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ExpenseIncomeBtn(
            onPressed: () {
              Get.toNamed(Routes.expenseIncomeScreen, arguments: 1);

            },
            color: Colors.red.shade500,
            icon: Icons.remove,
          ),
          ExpenseIncomeBtn(
            onPressed: () {
              Get.toNamed(Routes.expenseIncomeScreen, arguments: 2);

            },
            color: Colors.green.shade500,
            icon: Icons.add,
          ),
        ],
      ),
    );
  }
}
