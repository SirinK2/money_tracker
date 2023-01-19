import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/logic/controllers/balance_controller.dart';
import 'package:money_tracker/utils/app_colors.dart';
import 'package:money_tracker/view/widgets/text_util.dart';

import '../widgets/date_picker.dart';
import '../widgets/expenseIncome/category_grid_view_widget.dart';

class ExpenseIncomeScreen extends StatelessWidget {
  ExpenseIncomeScreen({Key? key}) : super(key: key);
  final controller = Get.find<BalanceController>();
  final TextEditingController textController = TextEditingController();

  InputBorder inputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      borderSide: BorderSide(color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Get.arguments == 1 ? "Expense" : "Income"),
          backgroundColor: AppColors.mainColor,
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: Get.width - 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: DatePikerWidget(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            )),
                        child: const Center(
                          child: TextUtil(
                            text: "SAR",
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 320,
                        child: TextField(
                          controller: textController,
                          cursorColor: AppColors.mainColor,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: InputDecoration(
                            hintText: 'Enter money here',
                            border: inputBorder(Colors.grey),
                            focusedBorder: inputBorder(AppColors.mainColor),
                            errorBorder: inputBorder(Colors.red),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const TextUtil(
                    text: 'Category',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CategoryGridViewWidget(
                      controller: controller, textController: textController),
                  const SizedBox(
                    height: 0,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
