import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/common/common_color.dart';
import 'package:smart_home/features/datails/model/model.dart';

class CustomCardView extends StatefulWidget {
  const CustomCardView({
    super.key,
    required this.model,
    required this.selectedMode,
  });
  final CustomModel model;
  final bool selectedMode;
  // final Function(bool value) onpress;

  @override
  State<CustomCardView> createState() => _CustomCardViewState();
}

class _CustomCardViewState extends State<CustomCardView> {
  // onpress() {
  //   setState(() {
  //     if (widget.flag == false) {
  //       setState(() {
  //         widget.flag = true;
  //       });
  //     } else if (widget.flag == true) {
  //       setState(() {
  //         widget.flag = false;
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 150,
      width: 120,
      decoration: BoxDecoration(
        color: maincolor,
        gradient: widget.selectedMode
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.tealAccent])
            : null,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.transparent.withOpacity(0.3),
                  shape: BoxShape.circle),
              child: Icon(
                widget.model.icon,
                size: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.model.value,
                  style: GoogleFonts.rubik(
                      letterSpacing: 1,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: widget.selectedMode ? Colors.black : Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
