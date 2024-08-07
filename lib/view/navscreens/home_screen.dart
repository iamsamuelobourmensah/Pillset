import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_set/view/widgets/colors.dart';
import 'package:pill_set/view/widgets/home_screen.dart';
import 'package:pill_set/view/widgets/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CalenderWidget(),

                const VitalsCard(),
                 SizedBox(
                     height: MediaQuery.sizeOf(context).height * .01,
                ),
                Ltext(color: greyColor, fw: FontWeight.bold, text: "Medication"),
                SizedBox(
                    height: MediaQuery.sizeOf(context).height * .2,
                    child: ListView.separated(
                      itemCount: listOfItemInMedCard.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.02,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return  MedCard(img:listOfItemInMedCard[index].img , medName: listOfItemInMedCard[index].medName, qty: listOfItemInMedCard[index].qty,);
                      },
                    ))
              ],
            ),
          ),
        ));
  }
}
