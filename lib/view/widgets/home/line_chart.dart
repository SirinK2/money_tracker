import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/logic/controllers/balance_controller.dart';
import 'package:money_tracker/model/category_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatelessWidget {
  LineChart({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<BalanceController>();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: Get.width,
            height: 300,
            child: Obx(() => controller.chartDbList.isNotEmpty
                ? Stack(
                    children: [
                      SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis: NumericAxis(),
                        tooltipBehavior: TooltipBehavior(enable: true),
                         series: <CartesianSeries>[
                          LineSeries<Chart, String>(
                            dataSource: controller.chartDbList,
                            xValueMapper: (Chart data, _) {
                              return data.categoryName;
                            },
                            yValueMapper: (Chart data, _) {
                              return data.amount;

                            },
                            pointColorMapper: (Chart data, _) => Color(data.color),
                            dataLabelSettings:
                                const DataLabelSettings(isVisible: true),
                            enableTooltip: true,
                          ),
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
                  ))));
  }
}
