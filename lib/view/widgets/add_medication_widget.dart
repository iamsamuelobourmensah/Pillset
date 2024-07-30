import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_set/view/widgets/colors.dart';
import 'package:pill_set/view/widgets/text.dart';

class AddMedicationWidget extends StatelessWidget {
  const AddMedicationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mText("Medicine type", greyColor, FontWeight.normal),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.08,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listOfImageInMedicineType.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: MedicineTypeContainer(
                        
                          img: listOfImageInMedicineType[index], index: index,),
                    );
                  }),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height*0.02,
            ),
            AddMedTextForm()
          ],
        ),
      ),
    );
  }
}

class AddMedTextForm extends StatelessWidget {
  AddMedTextForm({super.key});
  final TextEditingController _medTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          mText("Medicine Name", greyColor, FontWeight.normal),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter the name of your medication";
              }
              return null;
            },
            controller: _medTextEditingController,
            decoration: InputDecoration(
              hintText: "Enter name of Medication",
              hintStyle: GoogleFonts.montserrat(
                  color: ashColor, fontSize: 20, letterSpacing: 0.1),

              isDense: true,
              fillColor: whiteColor,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25)),
              // focusedBorder: BorderSide.none,
              // enabledBorder: InputBorder.none
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MedicineTypeContainer extends StatelessWidget {
   MedicineTypeContainer({
    super.key,
    this.img,
    this.text,
    required this.index
  });
  final String? img;
  final String? text;
  int? index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .07,
      width: MediaQuery.sizeOf(context).width * .2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: whiteColor,
        //   image: DecorationImage(image: AssetImage(img!)),
      ),
      child: Column(
        children: [Image.asset(img!,
      width: MediaQuery.sizeOf(context).width * .13,
      height: MediaQuery.sizeOf(context).height * .05,
        
        ),
           if(index == 0)
                              Text("Capsule",style:GoogleFonts.montserrat(
        color:greenColor,
        fontSize:15
      ) ,),
      if(index == 1)
      Text("Pill",style:GoogleFonts.montserrat(
        color:greenColor,
        fontSize:15
      ) ,),
      if(index == 2)
      Text("Syrup",style:GoogleFonts.montserrat(
        color:greenColor,
        fontSize:15
      ) ,),
        ],
      ),
    );
  }
}

class ImageInMedicineTypeContainer {
  static const String capsuleImage = "assets/images/capsules.png";
  static const String pillImage = "assets/images/pills.png";
  static const String syrupImage = "assets/images/syrup.png";
}

List listOfImageInMedicineType = [
  ImageInMedicineTypeContainer.capsuleImage,
  ImageInMedicineTypeContainer.pillImage,
  ImageInMedicineTypeContainer.syrupImage,
];
