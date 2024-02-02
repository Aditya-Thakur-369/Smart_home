// ignore_for_file: non_constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_home/features/datails/widgets/animation.dart';
import 'package:smart_home/features/home/controller/controller.dart';
import 'package:smart_home/features/home/widgets/add_device.dart';
import 'package:smart_home/features/home/widgets/custom_card.dart';
import 'package:smart_home/features/home/widgets/electricity_card.dart';
import 'package:smart_home/features/home/widgets/scale_fadeanimation.dart';
import 'package:smart_home/features/home/widgets/master_painter.dart';
import 'widgets/topbar.dart';
import 'package:smart_home/router/router.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});
  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  var model_list = Controller().model_list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B1D30),
      body: CustomPaint(
        painter: MasterPainter(),
        child: BounceFromBottomAnimation(
          delay: 10,
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              BounceFromBottomAnimation(delay: 6, child: topbar()),
              BounceFromBottomAnimation(delay: 6, child: addDevice()),
              const SizedBox(
                height: 20,
              ),
              BounceFromBottomAnimation(delay: 4, child: electricitycard()),
              const SizedBox(
                height: 10,
              ),
              BounceFromBottomAnimation(
                delay: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Linked to you ",
                        style: GoogleFonts.roboto(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      CupertinoButton(
                          alignment: Alignment.center,
                          borderRadius: BorderRadius.circular(15),
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          minSize: 20,
                          child: Row(
                            children: [
                              Text(
                                "See all  ",
                                style: GoogleFonts.roboto(
                                    fontSize: 14, color: Colors.grey),
                              ),
                              const Icon(
                                Iconsax.arrow_right_1,
                                color: Colors.grey,
                                size: 18,
                              )
                            ],
                          ),
                          onPressed: () {})
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 420,
                width: 420,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: Controller().model_list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    var data = Controller().model_list[index];
                    return ScaleFadeAnimation(
                      delay: 2.5,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                            onTap: () {
                              // context.go(Routes.detailsscreen.path);
                              GoRouter.of(context).push(
                                  Routes.detailsscreen.path,
                                  extra: data.model);
                            },
                            child: CustomCardView(model: data)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
