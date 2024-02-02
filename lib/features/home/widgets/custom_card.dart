// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home/common/common_color.dart';
import 'package:smart_home/features/datails/widgets/fade_animation.dart';
import 'package:smart_home/features/home/model/model.dart';

class CustomCardView extends StatefulWidget {
  Model model;
  bool flag = false;
  CustomCardView({Key? key, required this.model}) : super(key: key);

  @override
  State<CustomCardView> createState() => _CustomCardViewState();
}

class _CustomCardViewState extends State<CustomCardView> {
  onpress(bool value) {
    setState(() {
      widget.flag = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: maincolor,
        borderRadius: BorderRadius.circular(20),
        gradient: widget.flag
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue, Colors.tealAccent])
            : null, 
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.flag
                    ? RotateFadeAnimation(
                        delay: 2,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.flag
                                  ? Colors.white
                                  : const Color(0xFF1E1B29)),
                          child: Icon(
                            widget.model.icon,
                            size: 28,
                            color: widget.flag ? Colors.black : Colors.white,
                          ),
                        ),
                      )
                    : Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.flag
                                ? Colors.white
                                : const Color(0xFF1E1B29)),
                        child: Icon(
                          widget.model.icon,
                          size: 28,
                          color: widget.flag ? Colors.black : Colors.white,
                        ),
                      ),
                Column(
                  children: [
                    Text(
                      "${widget.model.model.value.toStringAsFixed(0)} ${widget.model.value}",
                      style: GoogleFonts.rubik(
                          fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.model.desc,
                      style: GoogleFonts.rubik(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                          color: widget.flag
                              ? Colors.white
                              : Colors.grey.shade400),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              widget.model.title1,
              style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1,
                  color: widget.flag
                      ? Colors.grey.shade800
                      : Colors.grey.shade400),
            ),
            Text(
              widget.model.title2,
              style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: widget.flag ? Colors.black : Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            CupertinoSwitch(
              activeColor: const Color(0xFF1B1D30),
              value: widget.flag,
              onChanged: (value) {
                onpress(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
