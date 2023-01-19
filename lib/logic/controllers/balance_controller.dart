import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/db/chart_db.dart';
import 'package:money_tracker/model/category_model.dart';
import 'package:money_tracker/utils/app_strings.dart';
import 'package:uuid/uuid.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';

class BalanceController extends GetxController {

  var balance = 0.0.obs;
  var income = <double>[].obs;
  var expense = <double>[].obs;

  var gridList1 = <Chart>[];
  var date = "".obs;
  var dateFormat = DateFormat("yyyy-MM-dd");
  var yMMMdDateFormat = DateFormat.yMMMd();

  var amountList = <double>[].obs;
  var chartDbList = <Chart>[].obs;

  var db = ChartDb.db;

  var salaryList = <Chart>[].obs;
  var depositsList = <Chart>[].obs;
  var savingList = <Chart>[].obs;
  var otherIncomeList = <Chart>[].obs;
  var foodList = <Chart>[].obs;
  var travelList = <Chart>[].obs;
  var homeList = <Chart>[].obs;
  var entertainmentList = <Chart>[].obs;
  var otherExpenseList = <Chart>[].obs;

  var incomeCategoryList = [
    Chart(
      id: const Uuid().v4(),
      categoryName: AppStrings.salary,
      amount: 0,
      icon: AppImages.salaryIcon,
      color: AppColors.salaryColor,
      date: '',
    ),
    Chart(
      id: const Uuid().v4(),
      categoryName: AppStrings.deposits,
      amount: 0,
      icon: AppImages.depositsIcon,
      color: AppColors.depositsColor,
      date: '',
    ),
    Chart(
      id: const Uuid().v4(),
      categoryName: AppStrings.saving,
      amount: 0,
      icon: AppImages.saveIcon,
      color: AppColors.saveColor,
      date: '',
    ),
    Chart(
      id: const Uuid().v4(),
      categoryName: AppStrings.otherIncome,
      amount: 0,
      icon: AppImages.otherIncomeIcon,
      color: AppColors.otherIncomeColor,
      date: '',
    ),
  ];

  var expenseCategoryList = [
    Chart(
      id: const Uuid().v4(),
      categoryName: AppStrings.food,
      amount: 0,
      color: AppColors.foodColor,
      icon: AppImages.foodIcon,
      date: '',
    ),
    Chart(
      id: const Uuid().v4(),
      categoryName: AppStrings.travel,
      amount: 0,
      icon: AppImages.travelIcon,
      color: AppColors.travelColor,
      date: '',
    ),
    Chart(
      id: const Uuid().v4(),
      categoryName: AppStrings.home,
      amount: 0,
      icon: AppImages.homeIcon,
      color: AppColors.homeColor,
      date: '',
    ),
    Chart(
      id: const Uuid().v4(),
      categoryName: AppStrings.entertainment,
      amount: 0,
      icon: AppImages.entertainmentIcon,
      color: AppColors.entertainmentColor,
      date: '',
    ),
    Chart(
      id: const Uuid().v4(),
      categoryName: AppStrings.otherExpense,
      amount: 0,
      icon: AppImages.otherExpenseIcon,
      color: AppColors.otherExpenseColor,
      date: '',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    _getAllData();
    _totalAmount();
  }

  String get dateFormatStr =>
      yMMMdDateFormat.format(dateFormat.parse(date.value)).toString();

  String get dateFormatNow => yMMMdDateFormat.format(DateTime.now());


  List<Chart> totalChart() {
    var theList = chartDbList;
    for (var element in theList) {
      if (element.categoryName == AppStrings.salary) {
        salaryList.add(element);
      } else if (element.categoryName == AppStrings.deposits) {
        depositsList.add(element);
      } else if (element.categoryName == AppStrings.saving) {
        savingList.add(element);
      } else if (element.categoryName == AppStrings.otherIncome) {
        otherIncomeList.add(element);
      } else if (element.categoryName == AppStrings.food) {
        foodList.add(element);
      } else if (element.categoryName == AppStrings.entertainment) {
        entertainmentList.add(element);
      } else if (element.categoryName == AppStrings.travel) {
        travelList.add(element);
      } else if (element.categoryName == AppStrings.home) {
        homeList.add(element);
      } else if (element.categoryName == AppStrings.otherExpense) {
        otherExpenseList.add(element);
      } else {
        continue;
      }
    }

    var salaryAmount = salaryList.map((e) => e.amount).sum;
    var depositsAmount = depositsList.map((e) => e.amount).sum;
    var savingAmount = savingList.map((e) => e.amount).sum;
    var otherIncomeAmount = otherIncomeList.map((e) => e.amount).sum;
    var foodAmount = foodList.map((e) => e.amount).sum;
    var entertainmentAmount = entertainmentList.map((e) => e.amount).sum;
    var travelAmount = travelList.map((e) => e.amount).sum;
    var homeAmount = homeList.map((e) => e.amount).sum;
    var otherExpenseAmount = otherExpenseList.map((e) => e.amount).sum;

    salaryList.clear();
    depositsList.clear();
    savingList.clear();
    otherIncomeList.clear();
    foodList.clear();
    entertainmentList.clear();
    travelList.clear();
    homeList.clear();
    otherExpenseList.clear();
    var finalList = [
      Chart(
          categoryName: AppStrings.salary,
          amount: salaryAmount,
          color: AppColors.salaryColor,
          icon: AppImages.salaryIcon,
          date: dateFormatNow),
      Chart(
        categoryName: AppStrings.deposits,
        amount: depositsAmount,
        icon: AppImages.depositsIcon,
        color: AppColors.depositsColor,
        date: dateFormatNow,
      ),
      Chart(
        categoryName: AppStrings.saving,
        amount: savingAmount,
        icon: AppImages.saveIcon,
        color: AppColors.saveColor,
        date: dateFormatNow,
      ),
      Chart(
        categoryName: AppStrings.otherIncome,
        amount: otherIncomeAmount,
        icon: AppImages.otherIncomeIcon,
        color: AppColors.otherIncomeColor,
        date: dateFormatNow,
      ),
      Chart(
        categoryName: AppStrings.food,
        amount: foodAmount,
        color: AppColors.foodColor,
        icon: AppImages.foodIcon,
        date: dateFormatNow,
      ),
      Chart(
        categoryName: AppStrings.travel,
        amount: travelAmount,
        icon: AppImages.travelIcon,
        color: AppColors.travelColor,
        date: dateFormatNow,
      ),
      Chart(
        categoryName: AppStrings.home,
        amount: homeAmount,
        icon: AppImages.homeIcon,
        color: AppColors.homeColor,
        date: dateFormatNow,
      ),
      Chart(
        categoryName: AppStrings.entertainment,
        amount: entertainmentAmount,
        icon: AppImages.entertainmentIcon,
        color: AppColors.entertainmentColor,
        date: dateFormatNow,
      ),
      Chart(
        categoryName: AppStrings.otherExpense,
        amount: otherExpenseAmount,
        icon: AppImages.otherExpenseIcon,
        color: AppColors.otherExpenseColor,
        date: dateFormatNow,
      ),
    ];

    gridList1.clear();
    for (var element in finalList) {
      if (element.amount != 0.0) {
        gridList1.add(element);
        update();
        // print(finalList);
      }
    }
    print("_________________");
print(gridList1.length);
    // print("salaryList $finalList");
    return finalList;
  }

  datePicker() async {
    var datePicker = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1999),
      lastDate: DateTime(2999),
    );


    

    if (datePicker != null) {
      date.value = datePicker.toString();
    }
  }

  void _getAllData() {
    db.getAllChart().then((value) => value.forEach((element) {
          chartDbList.add(element);
          print(chartDbList);
        }));
  }

  void _totalAmount() async {
    await db.getAllChart().then((value) => value.forEach((element) {
          amountList.add(element.amount);
          if (element.amount.toString().startsWith("-")) {
            expense.add(element.amount);
          } else {
            income.add(element.amount);
          }
        }));

    balance.value = amountList.sum;
  }

  RxList<Color> get colors =>
      _getChartData().map((e) => Color(e.color)).toList().obs;

  List<Chart> _getChartData() {
    return gridList1;
  }

  void addData(Chart chart) async {
    var list = chartDbList.map((element) => element.id);

    if (!list.contains(chart.id)) {
      await db.insertChart(chart);

      chartDbList.add(chart);

    } else {
      var amount = chartDbList
          .where((element) => element.categoryName == chart.categoryName)
          .map((e) => e.amount)
          .toList()
          .sum;

      var totalAmount = chart.amount + amount;

      await db.updateChart(Chart(
          id: chart.id,
          categoryName: chart.categoryName,
          amount: totalAmount,
          color: chart.color,
          icon: chart.icon,
          date: chart.date));

      chartDbList.clear();
      amountList.clear();
      _totalAmount();
      _getAllData();


    }   totalChart();

  }

  num sumBalance(double data) {
    var sum = data + amountList.sum;
    print(sum);
    balance.value = sum;
    return sum;
  }

  Color balanceValue() {
    if (balance.value == 0) {
      return AppColors.yellow;
    } else if (balance.value > 0) {
      return AppColors.mainColor;
    } else {
      return AppColors.red;
    }
  }
}
