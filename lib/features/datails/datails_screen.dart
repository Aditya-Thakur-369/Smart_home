// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smart_home/common/common_color.dart';
import 'package:smart_home/features/datails/model/model.dart';
import 'package:smart_home/features/datails/widgets/animation.dart';
import 'package:smart_home/features/datails/widgets/bounce_animation.dart';
import 'package:smart_home/features/datails/widgets/custom_cards.dart';
import 'package:smart_home/features/datails/widgets/custom_paint.dart';
import 'package:smart_home/features/datails/widgets/fade_animation.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
    required this.model,
  }) : super(key: key);
  final CustompageModel model;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool flag = false;
  Mode selectedMode = Mode.cold;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: MasterPainter1(),
        size: Size(MediaQuery.sizeOf(context).width,
            MediaQuery.sizeOf(context).height),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12, left: 10),
              child: BounceFromBottomAnimation(
                delay: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          // GoRouter.of(context).push(Routes.homescreen.path);
                          context.pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                        )),
                    Text(
                      // "Air Conditioner",
                      widget.model.detail_name,
                      style: GoogleFonts.rubik(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    RotateFadeAnimation(
                      delay: 2,
                      child: IconButton(
                          onPressed: () {}, icon: const Icon(Iconsax.setting)),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Working Space",
                  style: GoogleFonts.rubik(
                      fontSize: 12,
                      letterSpacing: 1,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Iconsax.arrow_down_1,
                      color: Colors.grey,
                      size: 16,
                    ))
              ],
            ),
            const SizedBox(
              height: 80,
            ),
            Stack(
              children: [
                SleekCircularSlider(
                    initialValue: widget.model.value,
                    appearance: CircularSliderAppearance(
                        size: 320,
                        customColors: CustomSliderColors(progressBarColors: [
                          const Color(0xFF9C7B86),
                          const Color(0xFF4A86FC),
                          const Color(0xFF4795EE),
                          const Color(0xFFF4B0AA)
                        ]),
                        animationEnabled: true,
                        angleRange: 240,
                        spinnerDuration: Duration.microsecondsPerSecond,
                        animDurationMultiplier: 2,
                        customWidths: CustomSliderWidths(
                            progressBarWidth: 8,
                            handlerSize: 20,
                            shadowWidth: 8,
                            trackWidth: 8)),
                    onChange: (double val) {
                      setState(() {
                        widget.model.value = val;
                      });
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 23, left: 20),
                  child: Container(
                    height: 280,
                    width: 280,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: maincolor,
                    ),
                    child: Center(
                        child: Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        Text(
                          "${widget.model.value.toStringAsFixed(0)} ${widget.model.detail_value}",
                          style: GoogleFonts.rubik(
                              fontSize: 50, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.model.detail_value1,
                          style: GoogleFonts.roboto(
                              letterSpacing: 1,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                        Text(
                          widget.model.detail_value3,
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                      ],
                    )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BounceFromBottomAnimation(
              delay: 2,
              child: Text(
                widget.model.detail_mode,
                style: GoogleFonts.roboto(
                    fontSize: 14,
                    letterSpacing: 1,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.model.detail_modename,
              style: GoogleFonts.rubik(
                  fontSize: 20,
                  letterSpacing: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ScaleFadeBounceAnimation(
                  delay: 0.5,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedMode = Mode.cold;
                      });
                    },
                    child: CustomCardView(
                      selectedMode: selectedMode == Mode.cold,
                      model: widget.model.model1,
                    ),
                  ),
                ),
                ScaleFadeBounceAnimation(
                  delay: 1.5,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedMode = Mode.fan;
                      });
                    },
                    child: CustomCardView(
                      selectedMode: selectedMode == Mode.fan,
                      model: widget.model.model2,
                    ),
                  ),
                ),
                ScaleFadeBounceAnimation(
                  delay: 2.5,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedMode = Mode.dry;
                      });
                    },
                    child: CustomCardView(
                      selectedMode: selectedMode == Mode.dry,
                      model: widget.model.model3,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            RotateFadeAnimation(
              delay: 2,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.model.value = 0;
                    flag = true;
                  });
                  Timer(Duration(milliseconds: 300), () {
                    setState(() {
                      flag = false;
                    });
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: flag ? 60 : 70,
                  width: flag ? 60 : 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.blue, Colors.tealAccent]),
                  ),
                  child: Icon(
                    CupertinoIcons.power,
                    size: flag ? 30 : 35,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Mode {
  cold,
  fan,
  dry,
}
