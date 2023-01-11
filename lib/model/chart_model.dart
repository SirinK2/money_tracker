import 'package:flutter/material.dart';

class ChartModel {
  final String categoryName;
  late double amount;
  final IconData icon;
  final Color color;

  ChartModel({
    required this.categoryName,
    required this.amount,
    required this.color,
    required this.icon,
  });
}
