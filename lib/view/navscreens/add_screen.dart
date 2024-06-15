import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_set/view/widgets/add_medication_widget.dart';
import 'package:pill_set/view/widgets/add_vitals_widget.dart';
import 'package:pill_set/view/widgets/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> with TickerProviderStateMixin {
  int isSelectedIndex = 1;
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    isSelectedIndex = tabController.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: greenColor,
        title: Text(
          "Add Vitals and Medication",
          style: GoogleFonts.montserrat(
            color: greyColor,
            fontSize: 20,
            letterSpacing: 0.02,
            fontWeight:FontWeight.bold
          ),
        ),
        bottom: PreferredSize(
            preferredSize:const Size.fromHeight(20),
            child: TabBar(
                controller: tabController,
                tabs: const [
                  TabIcon(tabtittle: "Add vitals"),
                  TabIcon(tabtittle: "Add Medication")],
                                
              indicator:BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: whiteColor,
      ),
    indicatorSize:TabBarIndicatorSize.tab,
    labelPadding: const EdgeInsets.all(4),
    labelColor: greenColor,
    unselectedLabelColor: greyColor,
                  ),),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          AddVitalsWidget(),
          AddMedicationWidget()
        ],
      ),
    );
  }
}


class TabIcon extends StatelessWidget {
  const TabIcon({super.key, required this.tabtittle});
  final String tabtittle;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(tabtittle,style: GoogleFonts.montserrat(
      
      fontSize:20,
      letterSpacing:0.02,
    ),));
  }
}
