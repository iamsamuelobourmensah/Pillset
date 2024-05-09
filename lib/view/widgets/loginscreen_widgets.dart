import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_set/view/widgets/colors.dart';

//final BuildContext context = context;

Widget loginText = Center(
  child: Text("Login Your Account",
      style: GoogleFonts.montserrat(
        color: greyColor,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.2,
        fontSize: 25,
      )),
);

Widget secondText = Center(
  child: Text("To track your health and medication",
      style: GoogleFonts.montserrat(
        color: ashColor,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.1,
        fontSize: 20,
      )),
);

Widget loginImage = Container(
  // height: MediaQuery.of(context).size.height * .1,
  // width: MediaQuery.of(context).size.width / 5,
  decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage("assets/images/login.png"))),
);

Widget emailText = Text(
  "Email",
  style: GoogleFonts.montserrat(
    color:greyColor,
    letterSpacing:0.1,
    fontSize:20,
    fontWeight:FontWeight.bold
  ),
);
Widget passwordText = Text(
  "Password",
  style: GoogleFonts.montserrat(
    color:greyColor,
    letterSpacing:0.1,
    fontSize:20,
    fontWeight:FontWeight.bold
  ),
);
