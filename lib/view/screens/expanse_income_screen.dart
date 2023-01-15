import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/logic/controllers/balance_controller.dart';
import 'package:money_tracker/utils/app_colors.dart';
import 'package:money_tracker/view/widgets/categories/category_icon.dart';
import 'package:money_tracker/view/widgets/text_util.dart';
import 'package:uuid/uuid.dart';
import '../../model/category_model.dart';
import '../widgets/date_picker.dart';

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
                  Align(alignment: Alignment.center, child: DatePikerWidget()
                      // TextUtil(
                      //   text: '5 Jan 2023',
                      //   fontSize: 18,
                      //   fontWeight: FontWeight.bold,
                      //   color: Colors.black,
                      //   textAlign: TextAlign.center,
                      // ),
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
                            text: "\$USD",
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
                  SizedBox(
                    height: 200,
                    child: GridView.builder(
                      itemCount: Get.arguments == 1
                          ? controller.expenseCategoryList.length
                          : controller.incomeCategoryList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                            // if (controller.textController.text.isNotEmpty) {
                              controller.addData(Get.arguments == 1
                                  ? Chart(
                                categoryName: data.categoryName,
                                amount:
                                double.parse("-${textController.text.trim()}"),
                                color: data.color,
                                icon: data.icon,
                                id: const Uuid().v4(),
                                date: controller.date.isNotEmpty
                                    ? controller.dateFormatStr
                                    : controller.dateFormatNow,
                              )
                                  : Chart(
                                categoryName: data.categoryName,
                                amount:
                                double.parse(textController.text.trim()),
                                color: data.color,
                                icon: data.icon,
                                id: const Uuid().v4(),
                                date: controller.date.isNotEmpty
                                    ? controller.dateFormatStr
                                    : controller.dateFormatNow,
                              ));
                              Get.arguments == 1
                                  ? controller.sumBalance(
                                  -double.parse(textController.text.trim()))
                                  : controller.sumBalance(
                                  double.parse(textController.text.trim()));

                              Get.back();
                              // }else{
                              //   Get.snackbar("Numbers only", "Please enter number only");
                              // }
                            // }else{
                            //   Get.snackbar("", "Please enter money amount");
                            // }
                          },
                          containerSize: 65,
                          iconSize: 50,
                        );
                      },
                    ),
                  ),
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
