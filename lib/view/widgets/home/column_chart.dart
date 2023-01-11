import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/logic/controllers/balance_controller.dart';
import 'package:money_tracker/model/category_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChart extends StatelessWidget {
  ColumnChart({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<BalanceController>();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: Get.width,
            height: 300,
            child:
        GetBuilder<BalanceController>(builder: (_){
          return controller.gridList1.isNotEmpty
                ? Stack(
              children: [
                SfCartesianChart(
                  primaryXAxis: CategoryAxis(isVisible: false),
                  primaryYAxis: NumericAxis(isVisible: false),
                  // palette: controller.colors,
                  series: <CartesianSeries>[
                    ColumnSeries<Chart, String>(
                      dataSource: controller.gridList1,
                      xValueMapper: (Chart data, _) {
                        return data.categoryName;
                      },
                      yValueMapper: (Chart data, _) {
                        return data.amount;
                      },
                      pointColorMapper: (Chart data, _) =>
                          Color(data.color),
                      dataLabelSettings:
                      const DataLabelSettings(isVisible: true),
                    ),
                  ],
                ),
                // Center(
                //   child: Text(
                //       "${controller.income.sum} \n${controller.expense.sum}"),
                // )
              ],
            )
                : SfCartesianChart(
              primaryXAxis: CategoryAxis(isVisible: false),
              primaryYAxis: NumericAxis(isVisible: false),
              // palette: controller.colors,
              series: <CartesianSeries>[
                ColumnSeries<int, int>(
                  dataSource: [1],
                  xValueMapper: (int data, _) {
                    return data;
                  },
                  yValueMapper: (int data, _) {
                    return data;
                  },
                  pointColorMapper: (int data, _) =>
                  Colors.grey,
                  dataLabelSettings:
                  const DataLabelSettings(isVisible: false),
                ),
              ],
            );

        })

        ));
    return Center(
        child: SizedBox(
            width: Get.width,
            height: 300,
            child: Obx(
              () => controller.gridList1.isNotEmpty
                  ? Stack(
                      children: [
                        SfCartesianChart(
                          primaryXAxis: CategoryAxis(isVisible: false),
                          primaryYAxis: NumericAxis(isVisible: false),
                          // palette: controller.colors,
                          series: <CartesianSeries>[
                            ColumnSeries<Chart, String>(
                              dataSource: controller.gridList1,
                              xValueMapper: (Chart data, _) {
                                return data.categoryName;
                              },
                              yValueMapper: (Chart data, _) {
                                return data.amount;
                              },
                              pointColorMapper: (Chart data, _) =>
                                  Color(data.color),
                              dataLabelSettings:
                                  const DataLabelSettings(isVisible: true),
                            ),
                          ],
                        ),
                        // Center(
                        //   child: Text(
                        //       "${controller.income.sum} \n${controller.expense.sum}"),
                        // )
                      ],
                    )
                  : SfCartesianChart(
                      primaryXAxis: CategoryAxis(isVisible: false),
                      primaryYAxis: NumericAxis(isVisible: false),
                      // palette: controller.colors,
                      series: <CartesianSeries>[
                        ColumnSeries<int, int>(
                          dataSource: [1],
                          xValueMapper: (int data, _) {
                            return data;
                          },
                          yValueMapper: (int data, _) {
                            return data;
                          },
                          pointColorMapper: (int data, _) =>
                              Colors.grey,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: false),
                        ),
                      ],
                    ),
            )));
  }
}
