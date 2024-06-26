import 'package:get/get.dart';
import 'package:pill_set/model/onboarding_screen_model.dart';


class OnboardingScreenController extends GetxController {
  Rx<int> currentScreen = 0.obs;

  final List<OnboardingScreenModel> screenDetails = [
    OnboardingScreenModel(
        mainImage: "assets/images/recepMed.png" ,
      
      
        tittle: "Reception drug",
        discription:
            "Add, edit, track admission on your drugs in two clicks. Marking a drug from your phone is easy as with the smart watch."),
    OnboardingScreenModel(
      mainImage: "assets/images/monitoring.png",
      tittle: "Monitoring health",
      discription:
          "View history your well-being after taking drugs in one click.",
    
    ),
    OnboardingScreenModel(
        mainImage: "assets/images/time.png",
        tittle: "Get notified",
        discription:
            "Our system will remind you of all the doses of the drug, so you dont have to keep everything in your mind.")
  ];
}
