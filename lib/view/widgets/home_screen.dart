import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_set/model/medcard_model.dart';
import 'package:pill_set/model/vitalscard_model.dart';
import 'package:pill_set/view/widgets/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({super.key});

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  CalendarFormat calenderFormat = CalendarFormat.week;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 10,
            top: -13,
            child: Text(
              "Your Plan",
              style: GoogleFonts.montserrat(
                  color: greyColor, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ), // YOUR PLAN TEXT
          Positioned(
            right: 20,
            top: -3,
            child: Container(
              height: 18,
              width: 18,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/calendaricon.png"),
                      fit: BoxFit.cover)),
            ),
          ),
          // CALENDAR ICON
          TableCalendar(
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: GoogleFonts.montserrat(
                color: ashColor,
              ),
              weekendStyle: GoogleFonts.montserrat(color: ashColor),
            ),
            headerStyle: HeaderStyle(
              rightChevronVisible: false,
              leftChevronVisible: false,
              formatButtonVisible: false,
              headerPadding: const EdgeInsets.only(left: 300, bottom: 10),
              titleTextStyle: GoogleFonts.montserrat(
                  color: ashColor,
                  fontSize: 10,
                  letterSpacing: 0.2,
                  fontWeight: FontWeight.w600),
            ),
            calendarStyle: CalendarStyle(
              tablePadding: const EdgeInsets.all(15),
              todayTextStyle: GoogleFonts.montserrat(
                  color: const Color(0xFFFAFAFA), fontSize: 18.0),
              todayDecoration:
                  BoxDecoration(color: greenColor, shape: BoxShape.circle),
              selectedDecoration:
                  BoxDecoration(color: greenColor, shape: BoxShape.circle),
              selectedTextStyle: GoogleFonts.montserrat(
                  color: const Color(0xFFFAFAFA), fontSize: 18.0),
            ),
            calendarFormat: calenderFormat,
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2050, 10, 16),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              setState(() {
                calenderFormat = format;
              });
            },
          ),
        ],
      ),
    );
  }
}
// END OF CALENDER

class VitalsCard extends StatefulWidget {
  const VitalsCard({
    super.key,
  });

  @override
  State<VitalsCard> createState() => _VitalsCardState();
}

class _VitalsCardState extends State<VitalsCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: GridView.builder(
          itemCount: listOfItemsInVitalsCard.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 10,
              mainAxisExtent: 200,
              crossAxisSpacing: 10,
              maxCrossAxisExtent: 200),
          itemBuilder: (context, index) {
            Color color = listOfItemsInVitalsCard[index].figureColor!;
            // DateTime _lastDateUpdated = DateTime.now();
            return Container(
              height: MediaQuery.sizeOf(context).height * 0.7,
              width: MediaQuery.sizeOf(context).width * 0.5,
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(23)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      listOfItemsInVitalsCard[index].tittle!,
                      style: GoogleFonts.montserrat(
                          fontSize: 15, color: greyColor),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.02,
                    ),
                    Image.asset(
                        height: 80,
                        width: 80,
                        listOfItemsInVitalsCard[index].img!),
                    Row(
                      children: [
                        Text(
                          listOfItemsInVitalsCard[index].figure!,
                          style: GoogleFonts.montserrat(
                              fontSize: 30,
                              color: color,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.015,
                        ),
                        Text(
                          listOfItemsInVitalsCard[index].unit!,
                          style: GoogleFonts.montserrat(
                            fontSize: 15, color: greyColor,
                            // fontWeight:FontWeight.bold
                          ),
                        ),
                      ],
                    ), //ROW CONTAINING FIGURE AND UNIT
                    Row(
                      children: [
                        Text(
                          "Last Update :",
                          style: GoogleFonts.montserrat(
                            fontSize: 12, color: greyColor,
                            // fontWeight:FontWeight.bold
                          ),
                        ),
                        Text(
                          listOfItemsInVitalsCard[index]
                              .dateTime!
                              .toIso8601String()
                              .substring(0, 10),
                          style: GoogleFonts.montserrat(
                            fontSize: 12, color: greyColor,
                            // fontWeight:FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    ); // End Of VitalsCard
  }
}

final List<VitalsCardModel> listOfItemsInVitalsCard = [
  VitalsCardModel("SATURATION", "assets/images/blood.png", "99", "%",
      DateTime.now(), greenColor),
  VitalsCardModel("HEART RATE", "assets/images/heart.png", "91", "bpm",
      DateTime.now(), greenColor),
  VitalsCardModel("PRESSURE", "assets/images/sphy.png", "117/90", "mmHg",
      DateTime.now(), greenColor),
  VitalsCardModel("TEMPERATURE", "assets/images/thermo.png", "36.2", "®C",
      DateTime.now(), amberColor)
];

class MedCard extends StatelessWidget {
  const MedCard(
      {super.key, required this.img, required this.medName, required this.qty});
  final String? img;
  final String? medName;
  final int? qty;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.1,
      width: MediaQuery.sizeOf(context).width * 1,
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(23)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Image.asset(height: 50, width: 50, img!),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
            Column(
              children: [
                Text(
                  medName!,
                  style: GoogleFonts.montserrat(
                      fontSize: 20,
                      color: greyColor,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      "$qty",
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: ashColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.01,
                    ),
                    Text(
                      "capsules",
                      style: GoogleFonts.montserrat(
                          fontSize: 15,
                          color: ashColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

              ],
            ),
                       const Spacer(),
                            Row(
                  children: List.generate(
                    5,
                    (index) => AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      height: 10,
                      width: 10,
                       margin: const EdgeInsets.symmetric(horizontal: 4),
                  
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ashColor
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

final List<MedCardModel> listOfItemInMedCard = [
  MedCardModel(img: "assets/images/greenmed.png", qty: 2, medName: "Cinupret"),
  MedCardModel(img: "assets/images/greenpill.webp", qty: 5, medName: "Centrum"),
  MedCardModel(img: "assets/images/pill.png", qty: 4, medName: "MN Garlic Oil"),
  MedCardModel(img: "assets/images/pinkpill.png", qty: 1, medName: "Clove-Ds"),
];
