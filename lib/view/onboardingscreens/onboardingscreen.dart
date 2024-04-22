import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_set/controller/onboardingscreencontroller.dart';
import 'package:pill_set/view/navscreens/navbar_screen.dart';
import 'package:pill_set/view/widgets/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OboardingScreenState();
}

final OnboardingScreenController _onboardingScreenController =
    Get.put(OnboardingScreenController());
int index = _onboardingScreenController.currentScreen.value;

final _pageController = PageController();


class _OboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Obx(
        () => Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    _onboardingScreenController.currentScreen.value = index;
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: _onboardingScreenController.screenDetails.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .6,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "${_onboardingScreenController.screenDetails[index].mainImage}",
                                ),
                              ),
                        ),
                        ),
                        // CONTAINER WITH THE PICTURE
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${_onboardingScreenController.screenDetails[index].tittle}",
                                style: GoogleFonts.montserrat(
                                  color: greyColor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.2,
                                  fontSize: 35,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .22,
                                child: Text(
                                  "${_onboardingScreenController.screenDetails[index].discription}",
                                  style: GoogleFonts.montserrat(
                                    color: ashColor,
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 0.1,
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * .04,
                        // ),
                      ],
                    );
                    //Column containing things in the pageviewbuilder
                  })),
            ),
            Positioned(
              left: 150,
              bottom: 10,
              child: Obx(
                () => Row(
                  children: List.generate(
                    _onboardingScreenController.screenDetails.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 300,
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      height: 7,
                      width: _onboardingScreenController.currentScreen.value ==
                              index
                          ? 20
                          : 10,
                      decoration: BoxDecoration(
                        color:
                            _onboardingScreenController.currentScreen.value ==
                                    index
                                ? greenColor
                                : greyColor,
                      ),
                    ),
                  ),
                ),
              ),
            ), //DOT INDICATOR

            Positioned(
              right: -20,
              bottom: 10,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .07,
                width: MediaQuery.of(context).size.width / 2.1,
                child: Center(
                  child: TextButton(
                    onPressed: () async {
                      nextButton();
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool("onboarding", true);
                    },
                    child: Text(
                      _onboardingScreenController.currentScreen.value == 2
                          ? "Get Started"
                          : "Next",
                      style: GoogleFonts.montserrat(
                        color: greenColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.1,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // NEXT BUTTON
            Positioned(
              bottom: 10,
              left: -5,
              child: TextButton(
                onPressed: () {
                  _pageController.animateToPage(
                      _onboardingScreenController.screenDetails.length - 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
                child: Text(
                  "Skip",
                  style: GoogleFonts.montserrat(
                    color: greyColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.1,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            //SKIP BUTTON
          ],
        ),
      ),
    );
  }
}

void nextButton() {
  _onboardingScreenController.currentScreen.value == 2
      ? Get.to(() => const NavBarScreen(), curve: Curves.easeIn)
      : _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
}
