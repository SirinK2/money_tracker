import 'package:flutter/material.dart';

class ExpenseIncomeBtn extends StatelessWidget {
  final Function() onPressed;
  final Color color;
  final IconData icon;

  const ExpenseIncomeBtn({
    Key? key,
    required this.onPressed,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(width: 4, color: color)),
        child: Center(
            child: Icon(
          icon,
          size: 50,
          color: color,
        )),
      ),
    );
  }
}
