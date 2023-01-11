import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:convert';
Chart chartFromJson(String str){
  final jsonData = json.decode(str);
  return Chart.fromMap(jsonData);

}

String chartToJson(Chart data){
  final dyn = data.toMap();
  return json.encode(dyn);
}




class Chart {
  String? id;
  String categoryName;
  double amount;
  int color;
  String icon;
  String date;

  Chart({ this.id,
      required this.categoryName,
      required this.amount,
      required this.color,
      required this.icon,
    required this.date
  });

  factory Chart.fromMap(Map<String, dynamic> json) {
    return Chart(
      id: json["id"],
      categoryName: json["category_name"],
      amount: json["amount"],
      color: json["color"],
      icon: json["icon"],
      date: json['date'],
    );
  }

  Map<String, dynamic> toMap() => {
     "id" :id,
    "category_name": categoryName,
    "amount": amount,
    "color": color,
    "icon": icon,
    'date': date
  };


}
