import 'package:flutter/material.dart';

import '../../../logic/controllers/balance_controller.dart';
import '../text_util.dart';

class MoneyHistoryWidget extends StatelessWidget {
  const MoneyHistoryWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BalanceController controller;

  @override
  Widget build(BuildContext context) {
    return
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
                        horizontal: 30.0 ),
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
                                const SizedBox(
                                  width: 10,
                                ),
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
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const Divider()
                ],
              );
            },
          );



    // return SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       const SizedBox(
    //         height: 20,
    //       ),
    //       ListView.builder(
    //         shrinkWrap: true,
    //         itemCount: controller.chartDbList.length,
    //         itemBuilder: (_, index) {
    //           var data = controller.chartDbList[index];
    //           return Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(
    //                     horizontal: 30.0),
    //                 child: Row(
    //                   mainAxisAlignment:
    //                   MainAxisAlignment.spaceBetween,
    //                   crossAxisAlignment:
    //                   CrossAxisAlignment.center,
    //                   children: [
    //                     Column(
    //                       crossAxisAlignment:
    //                       CrossAxisAlignment.start,
    //                       children: [
    //                         Row(
    //                           children: [
    //                             Container(
    //                               width: 10,
    //                               height: 10,
    //                               decoration: BoxDecoration(
    //                                   shape: BoxShape.circle,
    //                                   color: data.amount
    //                                       .toString()
    //                                       .startsWith("-")
    //                                       ? Colors.red
    //                                       : Colors.green),
    //                             ),
    //                             const SizedBox(
    //                               width: 10,
    //                             ),
    //                             TextUtil(
    //                               text: data.categoryName,
    //                               fontSize: 16,
    //                               fontWeight: FontWeight.bold,
    //                               color: Colors.black,
    //                               textAlign: TextAlign.start,
    //                             ),
    //                           ],
    //                         ),
    //                         TextUtil(
    //                           text: data.date,
    //                           fontSize: 12,
    //                           fontWeight: FontWeight.normal,
    //                           color: Colors.grey.shade700,
    //                           textAlign: TextAlign.start,
    //                         ),
    //                       ],
    //                     ),
    //                     Text(
    //                       "${data.amount.toStringAsFixed(2)} USD",
    //                       style: const TextStyle(
    //                           fontSize: 14,
    //                           fontWeight: FontWeight.w500),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               const Divider()
    //             ],
    //           );
    //         },
    //       ),
    //
    //
    //     ],
    //   ),
    // );
  }
}