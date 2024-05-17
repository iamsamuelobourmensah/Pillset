import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_set/view/authenticating_screen.dart/signup_screen.dart';
import 'package:pill_set/view/widgets/colors.dart';
import 'package:pill_set/view/widgets/loginscreen_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late String password;

  late String email;
  bool isObscure = true;
  @override
  void dispose() {
    // TODO: implement dispose
emailController;
    passwordController;
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor.withOpacity(0.95),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .1,
                ),
                loginText,
                secondText,
                SizedBox(
                    height: MediaQuery.of(context).size.height * .4,
                    width: MediaQuery.of(context).size.width,
                    child: loginImage),
                emailText,
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
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
                ), // EMAIL TEXTFORMFIELD
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                passwordText,
                TextFormField(
                  controller: passwordController,
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
                ), // Password textform
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(greenColor),
                          shape: const MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero)),
                        ),
                        onPressed: () {
                          Get.to(() => const SignupScreen());
                        },
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
    );
  }
}
