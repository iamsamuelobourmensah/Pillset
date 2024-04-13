import 'package:get/get.dart';
import 'package:pill_set/model/onboarding_screen_model.dart';

class OnboardingScreenController extends GetxController {
  Rx<int> currentScreen = 1.obs;

  List screenDetails = <OnboardingScreenModel>[
    OnboardingScreenModel(
       
        mainImage: "assets/images/watch.png",
        image1: "assets/images/greenmed.png",
        image2: "assets/images/greenpill.webp",
        tittle: "Reception drug",
        discription: "Add, edit, track admission on your drugs in two clicks. Marking a drug from your phone is easy as with the smart watch."),
   
    OnboardingScreenModel(
      mainImage: "assets/images/heart.png",
      image1: "assets/images/search.webp",
      tittle: "Monitoring health",
      discription:
          "View history your well-being after taking drugs in one click.",
      image2: null,
    ),

    
  ];
}
