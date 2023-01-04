import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_tracker/utils/app_images.dart';
import 'package:money_tracker/view/widgets/home/flexible_space_bar.dart';
import 'package:money_tracker/view/widgets/text_util.dart';

import '../../utils/app_colors.dart';
import '../widgets/home/bottom_nav_widget.dart';
import '../widgets/home/expense_income_btn.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavWidget(),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.filter_alt_outlined,
              size: 30,
            ),
          ),
          elevation: 0,
          backgroundColor: AppColors.mainColor,
          expandedHeight: 90,

          flexibleSpace: const FlexibleSpaceBarWidget(),
          pinned: true,

        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              TextUtil(
                  text: "Hello",
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  textAlign: TextAlign.center),
              //text range


              //spending analysis

              //balance

              //
            ],
          ),
        )
      ]),
    );
  }
}
