import 'package:flutter/material.dart';
import 'package:money_tracker/view/widgets/text_util.dart';

class CategoryIcon extends StatelessWidget {
  final String icon;
  final int color;
  final String text;
  final double containerSize;
  final double iconSize;

  final Function()? onSelected;

  const CategoryIcon({
    Key? key,
    required this.icon,
    required this.color,
    required this.text,
     this.onSelected, required this.containerSize, required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelected,
      child: Container(
        width: containerSize,
        height: containerSize,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [

            Container(
              width: iconSize,
              height: iconSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(color)
              ),
              child: Center(
                child: Image.asset(
                  icon,
                  fit: BoxFit.none,
                  // color:   Color(color),
                ),
              ),
            ),

            const SizedBox(height: 5,),

            TextUtil(
              text: text,
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(color),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
