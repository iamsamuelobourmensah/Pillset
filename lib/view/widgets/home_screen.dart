import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
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
      padding: const EdgeInsets.only(top: 70),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 15,
            top: -13,
            child: Text("Your Plan",style: GoogleFonts.montserrat(
                    color:greyColor,
                    fontSize:30,
                     fontWeight:FontWeight.bold
                  ),),
          ),
          Positioned(
            right:24,
            top: -3,
            child: Container(
              height: 18,
              width: 18,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/calendaricon.png"),fit: BoxFit.cover)
              ),
            ),
          ),
          TableCalendar(
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle:GoogleFonts.montserrat(
                  color:ashColor,
                 
                ),
                weekendStyle:GoogleFonts.montserrat(
                  color:ashColor
                ),),
            headerStyle: HeaderStyle(
              
                rightChevronVisible: false,
                leftChevronVisible: false,
                formatButtonVisible: false,
                headerPadding: const EdgeInsets.only(left: 300,bottom: 10),
                titleTextStyle: GoogleFonts.montserrat(
                   color: ashColor,
                    fontSize: 10,
                    letterSpacing: 0.2,
                    fontWeight: FontWeight.w600
                ),),
            calendarStyle: CalendarStyle(
              tablePadding: const EdgeInsets.all(15),
              
              todayTextStyle :GoogleFonts.montserrat(
                color: const Color(0xFFFAFAFA), fontSize: 18.0
                ),
              todayDecoration:
                  BoxDecoration(color: greenColor, shape: BoxShape.circle),
              selectedDecoration:
                  BoxDecoration(color: greenColor, shape: BoxShape.circle),
                  selectedTextStyle : GoogleFonts.montserrat(
                color: const Color(0xFFFAFAFA), fontSize: 18.0
                ),
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
