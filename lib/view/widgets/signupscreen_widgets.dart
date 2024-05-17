import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_set/view/widgets/colors.dart';

Widget signupText = Center(
  child: Text("Create Your Account",
      style: GoogleFonts.montserrat(
        color: greyColor,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.2,
        fontSize: 25,
      )),
);
Widget signupSecondText = Center(
  child: Text("To track your health",
      style: GoogleFonts.montserrat(
        color: ashColor,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.1,
        fontSize: 20,
      )),
);

Widget signupImage = Container(
  // height: MediaQuery.of(context).size.height * .1,
  // width: MediaQuery.of(context).size.width / 5,
  decoration: const BoxDecoration(
      image: DecorationImage(image: AssetImage("assets/images/login1.png"))),
);
Widget fullnameText = Text(
  "Full Name",
  style: GoogleFonts.montserrat(
    color:greyColor,
    letterSpacing:0.1,
    fontSize:20,
    fontWeight:FontWeight.bold
  ),
);
Widget confirmpasswordText = Text(
  "confirm Password",
  style: GoogleFonts.montserrat(
    color:greyColor,
    letterSpacing:0.1,
    fontSize:20,
    fontWeight:FontWeight.bold
  ),
);
void  snackBar (localBuildContext,text) {
 ScaffoldMessenger.of(localBuildContext).showSnackBar(
            SnackBar(
              content: Text(text),
            ),
          );
}