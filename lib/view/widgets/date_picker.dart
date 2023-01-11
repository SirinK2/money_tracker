import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../logic/controllers/balance_controller.dart';

class DatePikerWidget extends StatelessWidget {
  DatePikerWidget({Key? key}) : super(key: key);

  final controller = Get.find<BalanceController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Obx(
        () => Text(
          controller.date.value.isNotEmpty
              ? controller.dateFormatStr
              : controller.dateFormatNow,
        ),
      ),
      onTap: () async {
        await controller.datePicker();
      },
    );
  }
}
