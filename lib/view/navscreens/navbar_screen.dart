import 'package:curved_navigation_bar_with_label/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
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
      bottomNavigationBar: CurvedNavigationBar(
             index: _navScreenController.isSelectedIdex.value,

        onTap: (value) {
              setState(() {
                _navScreenController.isSelectedIdex.value = value;
              });
            },
        items: [
            CurvedNavigationBarItem(
                //backgroundColor: Colors.amber,
                icon: const Icon(Icons.home,size: 29,),
                label: "Home",
              ),
              CurvedNavigationBarItem(
                  icon: const Icon(Icons.radar,size: 29,), label: "Monitoring"),
              CurvedNavigationBarItem(
                  icon: Container(
                    decoration: ShapeDecoration(
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.12,
                    child:  Icon(
                      Icons.add,
                      color: whiteColor ,
                      size: 38,
                    ),
                  ),
                  label: "Add Plan"),
              CurvedNavigationBarItem(
                  icon: const Icon(Icons.poll_outlined,size: 29,), label: "Statistic"),
               CurvedNavigationBarItem(
                  icon: const Icon(Icons.person,size: 29,), label: "Account"),
        ]
       
       
       ),
       body:
          _navScreenController.pages[_navScreenController.isSelectedIdex.value],
    );
  }
}