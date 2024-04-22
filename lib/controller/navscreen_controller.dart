import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pill_set/view/navscreens/add_screen.dart';
import 'package:pill_set/view/navscreens/home_screen.dart';
import 'package:pill_set/view/navscreens/monitoring_screen.dart';
import 'package:pill_set/view/navscreens/profile.dart';
import 'package:pill_set/view/navscreens/stat_screen.dart';

class NavScreenController extends GetxController {
  Rx<int> isSelectedIdex = 2.obs;

  final List pages = <Widget>[
    const HomeScreen(),
    const MonitoringScreen(),
    const AddScreen(),
    const StatisticScreen(),
    const ProfileScreen()
  ];
}
