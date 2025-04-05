import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashBoardViewBody extends StatelessWidget {
  const DashBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: MaterialButton(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 48),
            onPressed: () {},
            textColor: Colors.white,
            color: Color(0xff1B5E37),
            minWidth: double.infinity,
            height: 54,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'Add Data',
              style: GoogleFonts.cairo(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
