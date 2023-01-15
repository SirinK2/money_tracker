import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_tracker/logic/controllers/balance_controller.dart';
import 'package:money_tracker/utils/app_strings.dart';
import 'package:money_tracker/view/widgets/home/flexible_space_bar.dart';
import '../../utils/app_colors.dart';
import '../widgets/home/category_grid.dart';
import '../widgets/home/bottom_nav_widget.dart';
import '../widgets/home/doughnut_chart.dart';
import '../widgets/home/column_chart.dart';
import '../widgets/home/line_chart.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({Key? key}) : super(key: key);

  final controller = Get.find<BalanceController>();
  RxBool chart = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavWidget(),
      // bottomSheet: BalanceBottomSheet(),
      body: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                onPressed: () {
                  chart.value = !chart.value;
                },
                icon: Obx(
                  () => Icon(
                    chart.value ? Icons.circle_outlined : Icons.bar_chart,
                  ),
                ),
              ),
            ],
            shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            // leading: IconButton(
            //   onPressed: () {
            //     controller.db.deleteMyDatabase();
            //     // print(controller.totalChart());
            //     // print(AppColors.salaryColor.toString());
            //   },
            //   icon: const Icon(
            //     Icons.filter_alt_outlined,
            //     size: 30,
            //   ),
            // ),
            elevation: 0,
            backgroundColor: AppColors.mainColor,
            expandedHeight: 100,
            flexibleSpace: const FlexibleSpaceBarWidget(),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Obx(() => !chart.value ? DoughnutChart() : ColumnChart()),
                // LineChart(),

                CategoryGrid(
                  controller: controller,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
