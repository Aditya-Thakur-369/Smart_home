import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_home/features/datails/widgets/fade_animation.dart';

Widget topbar() {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const RotateFadeAnimation(
          delay: 2,
          child: Icon(
            Iconsax.menu,
            size: 30,
          ),
        ),
        Container(
          height: 55,
          width: 55,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.teal,
                    Colors.purple,
                  ])),
          clipBehavior: Clip.antiAlias,
          child: const Padding(
              padding: EdgeInsets.all(2.0),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/girl.webp"),
              )),
        ),
      ],
    ),
  );
}
