// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smart_home/common/common_color.dart';
import 'package:smart_home/features/datails/model/model.dart';
import 'package:smart_home/features/datails/widgets/custom_cards.dart';
import 'package:smart_home/features/datails/widgets/custom_paint.dart';

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
  @override
  Widget build(BuildContext context) {
    double value = widget.model.value;
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
                    style: GoogleFonts.roboto(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Iconsax.setting)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Working Space",
                  style: GoogleFonts.roboto(
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
                        value = val;
                      });
                        print(value);
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
                          "${widget.model.value}",
                          style: GoogleFonts.aboreto(
                              fontSize: 50, fontWeight: FontWeight.bold),
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
            Text(
              widget.model.detail_mode,
              style: GoogleFonts.roboto(
                  fontSize: 14,
                  letterSpacing: 1,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.model.detail_modename,
              style: GoogleFonts.roboto(
                  fontSize: 20,
                  letterSpacing: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                CustomCardView(
                  model: widget.model.model1,
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomCardView(
                  model: widget.model.model2,
                ),
                const SizedBox(
                  width: 20,
                ),
                CustomCardView(
                  model: widget.model.model3,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue, Colors.tealAccent]),
              ),
              child: const Icon(
                CupertinoIcons.power,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
