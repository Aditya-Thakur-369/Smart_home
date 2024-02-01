// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_home/router/router.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({
    Key? key,
    required this.selectedIndex,
    required this.child,
  }) : super(key: key);
  final int selectedIndex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: selectedIndex == 0,
        onPopInvoked: (didPop) {
          if (selectedIndex != 0) {
            context.go(Routes.homescreen.path);
          }
        },
        child: Stack(
          children: [
            child,
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: const SizedBox(
                  height: 50,

                ),
              ),
            )
          ],
        ));
  }
}


class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}