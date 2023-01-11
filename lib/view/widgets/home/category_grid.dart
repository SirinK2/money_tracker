import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../logic/controllers/balance_controller.dart';
import '../categories/category_icon.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BalanceController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 2,
      child:GetBuilder<BalanceController>(builder: (_){
        return  GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.gridList1.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 1.5),
          itemBuilder: (_, index) {
            var data = controller.gridList1[index];

            print(controller.gridList1.length);
            return CategoryIcon(
              icon: data.icon,
              color: data.color,
              text: data.categoryName,
              containerSize: 40,
              iconSize: 35,
            );
          },
        );
      }),
    );
    return SizedBox(
      height: Get.height / 2,
      child: Obx(
        () {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.gridList1.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 1.5),
            itemBuilder: (_, index) {
              var data = controller.gridList1[index];

              print(controller.gridList1.length);
              return CategoryIcon(
                icon: data.icon,
                color: data.color,
                text: data.categoryName,
                containerSize: 40,
                iconSize: 35,
              );
            },
          );
        },
      ),
    );
  }
}
