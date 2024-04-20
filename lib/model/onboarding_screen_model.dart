import 'dart:ffi';

class OnboardingScreenModel {
  final String? mainImage;
  final String? btnText;
  final String? tittle;
  final String? discription;
 final void Function()? onTap;

  OnboardingScreenModel({this.onTap, this.btnText,  this.mainImage,  this.tittle,  this.discription});
  
  
}
