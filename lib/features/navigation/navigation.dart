import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_home/common/common_color.dart';
import 'package:smart_home/features/graph/graph_screen.dart';
import 'package:smart_home/features/home/homescreen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;
  List<IconData> icondata = [
    Iconsax.home,
    Iconsax.graph,
    Icons.switch_access_shortcut_add_rounded,
    Iconsax.setting,
  ];
  List<Widget> pages = [
    const HomeScreenView(),
    GraphScreen(),
    const Center(
      child: Text("Center"),
    ),
    const Center(
      child: Text("Center"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
            materialTapTargetSize: MaterialTapTargetSize.padded,
            autofocus: true,
            splashColor: Colors.lightBlueAccent,
            hoverColor: Colors.blue,
            backgroundColor: Colors.lightBlue,
            shape: const CircleBorder(side: BorderSide(color: Colors.teal)),
            onPressed: () {},
            child: const Icon(
              Iconsax.microphone,
              size: 45,
              color: Colors.white,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      bottomNavigationBar: Material(
        child: Container(
          height: 100,
          decoration: const BoxDecoration(color: Color(0xFF282636)),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: icondata.length,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 33, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: SizedBox(
                    width: index == 0
                        ? 40
                        : index == 3
                            ? 35
                            : 30,
                    height: 30,
                    child: Icon(
                      icondata[index],
                      color:
                          index == selectedIndex ? Colors.white : Colors.grey,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      body: pages[selectedIndex],
    );
  }
}
