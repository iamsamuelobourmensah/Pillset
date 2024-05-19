import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_set/controller/auth_controller.dart';
import 'package:pill_set/view/authenticating_screen.dart/login_screen.dart';
import 'package:pill_set/view/navscreens/navbar_screen.dart';
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
  final AuthController _authController = Get.put(AuthController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final fullNameController = TextEditingController();
  bool isLoading = false;
  late String fullName;
  late String password;
  late String email;
  bool isObscure = true;
  bool secondObscure = true;
  @override
  void dispose() {
    // TODO: implement dispose
    emailController;
    passwordController;
    fullNameController;
    confirmPasswordController;
    super.dispose();
  }

  createNewUser() async {
    BuildContext localBuildContext = context;
    setState(() {
      isLoading = true;
    });
    String response =
        await _authController.createNewAccount(email, password, fullName);
    if (response == "success") {
      Get.to(() => const NavBarScreen());
      Future.delayed(Duration.zero, () {
        snackBar(localBuildContext,
            "Congratulation you have successfully created an account ");
      });
    } else {
      setState(() {
        isLoading = false;
      });
        Future.delayed(Duration.zero, () {
        snackBar(localBuildContext,
           response);
      });
    }
  }

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
                    controller: fullNameController,
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
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter your email";
                      } else if (!RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$')
                          .hasMatch(value)) {
                        return "enter a valid email";
                      }
                      return null;
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
                  ), // Password textform// EMAIL TEXTFORMFIELD
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  confirmpasswordText,
                  TextFormField(
                    controller: confirmPasswordController,
                    obscureText: secondObscure,
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "confirm password";
                      } else if (passwordController.value !=
                          confirmPasswordController.value) {
                        return "password does not match";
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
                          secondObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
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
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              createNewUser();
                            }

                            fullNameController.clear();
                            emailController.clear();
                            passwordController.clear();
                            confirmPasswordController.clear();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: isLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Text(
                                    "Sign up",
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.bold,
                                        color: greyColor,
                                        fontSize: 20,
                                        letterSpacing: 0.1),
                                  ),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Get.to(const LoginScreen());
                          },
                          child: Text(
                            "already have an account?",
                            style: GoogleFonts.montserrat(
                                color: greyColor, fontSize: 15),
                          ))
                    ],
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
