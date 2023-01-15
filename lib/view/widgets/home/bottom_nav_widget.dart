import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/route/route.dart';
import 'package:money_tracker/view/widgets/text_util.dart';

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
            () => InkWell(
              onTap: () {
                Get.bottomSheet(Container(
                  width: Get.width,
                  height: Get.height,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.chartDbList.length,
                          itemBuilder: (_, index) {
                            var data = controller.chartDbList[index];
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [


                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(

                                                    shape: BoxShape.circle,
                                                    color: data.amount
                                                        .toString()
                                                        .startsWith("-")
                                                        ? Colors.red
                                                        : Colors.green),
                                              ),
                                              SizedBox(width: 10,),

                                              TextUtil(
                                                text: data.categoryName,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                textAlign: TextAlign.start,
                                              ),
                                            ],
                                          ),
                                          TextUtil(
                                            text: data.date,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.grey.shade700,
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),

                                      Text(
                                        "${data.amount.toStringAsFixed(2)} USD",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider()
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ));
              },
              child: Container(
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
