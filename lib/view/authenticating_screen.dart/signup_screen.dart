import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_set/view/widgets/colors.dart';
import 'package:pill_set/view/widgets/loginscreen_widgets.dart';
import 'package:pill_set/view/widgets/signupscreen_widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final emailController = TextEditingController().clear();
  final passwordController = TextEditingController().clear();
  late String fullName;
  late String password;

  late String email;
  bool isObscure = true;
  bool secondObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.withOpacity(0.95),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.5,
                  // ),
                  signupText,
                  signupSecondText,
                  SizedBox(
                      height: MediaQuery.of(context).size.height * .3,
                      width: MediaQuery.of(context).size.width,
                      child: signupImage),
                  fullnameText,
                  TextFormField(
                    onChanged: (value) {
                      fullName = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter your Fullname";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        fillColor: whiteColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelText: "enter your Fullname",
                        labelStyle: GoogleFonts.montserrat(
                            color: greyColor, fontSize: 20, letterSpacing: 0.1),
                        prefixIcon: Icon(
                          Icons.perm_identity,
                          color: greenColor,
                          size: 31,
                        )),
                  ),
                                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  emailText, //emailText
                  TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter your email";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        fillColor: whiteColor,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelText: "enter your email",
                        labelStyle: GoogleFonts.montserrat(
                            color: greyColor, fontSize: 20, letterSpacing: 0.1),
                        prefixIcon: Icon(
                          Icons.email,
                          color: greenColor,
                          size: 31,
                        )),
                  ),
                                    SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  passwordText,
                  TextFormField(
                    obscureText: isObscure,
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter your password";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: whiteColor,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      labelText: "enter your password",
                      labelStyle: GoogleFonts.montserrat(
                          color: greyColor, fontSize: 20, letterSpacing: 0.1),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: greenColor,
                        size: 31,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        child: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility,
                          color: greyColor,
                          size: 31,
                        ),
                      ),
                    ),
                  ), // Password textform// EMAIL TEXTFORMFIELD
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  confirmpasswordText,
                  TextFormField(
                    obscureText: secondObscure,
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password does match";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      fillColor: whiteColor,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      labelText: "confirm your password",
                      labelStyle: GoogleFonts.montserrat(
                          color: greyColor, fontSize: 20, letterSpacing: 0.1),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: greenColor,
                        size: 31,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            secondObscure = !secondObscure;
                          });
                        },
                        child: Icon(
                          secondObscure ? Icons.visibility_off : Icons.visibility,
                          color: greyColor,
                          size: 31,
                        ),
                      ),
                    ),
                  ), // confirmPassword textform
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(greenColor),
                            shape: const MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero)),
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Sign in",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: greyColor,
                                  fontSize: 20,
                                  letterSpacing: 0.1),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
