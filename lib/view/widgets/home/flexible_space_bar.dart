import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlexibleSpaceBarWidget extends StatelessWidget {
  const FlexibleSpaceBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      // background: Center(
      //   child: Text(
      //     'Monefy',
      //     style: GoogleFonts.satisfy(
      //         fontSize: 30,
      //         color: Colors.white
      //     ),
      //   ),
      // ),
      title: Text(
        'Monefy',
        style: GoogleFonts.satisfy(
            fontSize: 20,
            color: Colors.white
        ),
      ),
      centerTitle: true,
    );
  }
}
