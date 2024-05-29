import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pill_set/controller/navscreen_controller.dart';
import 'package:pill_set/view/widgets/colors.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

final NavScreenController _navScreenController = Get.put(NavScreenController());

class _NavBarScreenState extends State<NavBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
            index: _navScreenController.isSelectedIdex.value,
            backgroundColor: greenColor,
            onTap: (value) {
              setState(() {
                _navScreenController.isSelectedIdex.value = value;
              });
            },
            items: [
               Icon(
                Icons.home,
                color:ashColor ,
                size: 33,
              ),
               Icon(
                Icons.radar,
                size: 33,
                color: ashColor,
              ),
              Container(
                decoration: ShapeDecoration(
                    color:greyColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.12,
                child: Icon(
                  Icons.add,
                  color: whiteColor,
                  size: 38,
                ),
              ),
               Icon(Icons.bar_chart, size: 33, color: ashColor),
               Icon(Icons.person, size: 33, color: ashColor),
            ]),
      ),
      body:
          _navScreenController.pages[_navScreenController.isSelectedIdex.value],
    );
  }
}
