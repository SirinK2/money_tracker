import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/route/route.dart';

import '../../../logic/controllers/balance_controller.dart';
import 'expense_income_btn.dart';

class BottomNavWidget extends StatelessWidget {
  BottomNavWidget({Key? key}) : super(key: key);
  final controller = Get.find<BalanceController>();

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
          Obx(
            () => Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                  color: controller.balanceValue(),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "Balance ${controller.balance.value}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
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
