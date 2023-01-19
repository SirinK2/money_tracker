import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/logic/controllers/balance_controller.dart';
import 'package:money_tracker/model/category_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class DoughnutChart extends StatelessWidget {
  DoughnutChart({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<BalanceController>();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: Get.width,
            height: 300,
            child: GetBuilder<BalanceController>(builder: (_){
              return controller.gridList1.isNotEmpty
                  ? Stack(
                children: [
                  SfCircularChart(
                    tooltipBehavior: TooltipBehavior(enable: false),
                    palette: controller.colors,
                    series: <CircularSeries>[
                      DoughnutSeries<Chart, String>(
                          dataSource: controller.gridList1,
                          xValueMapper: (Chart data, _) =>
                          data.categoryName,
                          yValueMapper: (Chart data, _)  {
                            return data.amount;

                          },
                          dataLabelSettings:
                          const DataLabelSettings(isVisible: true),
                          enableTooltip: true),
                    ],
                  ),

                ],
              )
                  : SfCircularChart(
                tooltipBehavior: TooltipBehavior(enable: false),
                palette: const [Colors.grey],
                series: <CircularSeries>[
                  DoughnutSeries<int, int>(
                    dataSource: const [1],
                    xValueMapper: (data, _) => data,
                    yValueMapper: (data, _) => data,
                    dataLabelSettings:
                    const DataLabelSettings(isVisible: false),
                  ),
                ],
              );
            }))

        );
  }
}
