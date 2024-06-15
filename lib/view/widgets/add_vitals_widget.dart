import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pill_set/main.dart';
import 'package:pill_set/model/vital_hive_model.dart';
import 'package:pill_set/view/widgets/boxes.dart';
import 'package:pill_set/view/widgets/colors.dart';

class AddVitalsWidget extends StatefulWidget {
  const AddVitalsWidget({super.key});

  @override
  State<AddVitalsWidget> createState() => _AddVitalsWidgetState();
}

class _AddVitalsWidgetState extends State<AddVitalsWidget> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController temperatureController = TextEditingController();
  final TextEditingController saturationController = TextEditingController();
  final TextEditingController heartRateController = TextEditingController();
  final TextEditingController pressureController = TextEditingController();
  DateTime dateTime = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temperatureController;
    saturationController;
    heartRateController;
    pressureController;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    temperatureController;
    saturationController;
    heartRateController;
    pressureController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AddVitalsTextField(
                  vitalText: 'Blood Pressure(mmHg)',
                  labelText: '117/80',
                  textEditingController: pressureController,
                ),
                AddVitalsTextField(
                  vitalText: "Temperature(°C)",
                  labelText: "36.2",
                  textEditingController: temperatureController,
                ),
                AddVitalsTextField(
                  vitalText: "Heart Rate(bpm)",
                  labelText: "96",
                  textEditingController: heartRateController,
                ),
                AddVitalsTextField(
                  vitalText: "Saturation(%)",
                  labelText: "99",
                  textEditingController: saturationController,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.03,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(greenColor),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        temperatureBox.put(
                            "key$dateTime",
                            VitalsHive(
                                temperature: temperatureController.text,
                                saturation: saturationController.text,
                                lastUpdated: dateTime,
                                pressure: pressureController.text,
                                heartRate: heartRateController.text));
                        // saturationBox.put("key$dateTime", VitalsHive(temperature: temperatureController.text, saturation: saturationController.text, lastUpdated: dateTime, pressure: pressureController.text, heartRate: heartRateController.text));
                        // pressureBox.put("key$dateTime", VitalsHive(temperature: temperatureController.text, saturation: saturationController.text, lastUpdated: dateTime, pressure: pressureController.text, heartRate: heartRateController.text));
                        // heartRateBox.put("key$dateTime", VitalsHive(temperature: temperatureController.text, saturation: saturationController.text, lastUpdated: dateTime, pressure: pressureController.text, heartRate: heartRateController.text));
                        temperatureController.clear();
                        saturationController.clear();
                        pressureController.clear();
                        heartRateController.clear();
                        defaultBoxValues();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 70),
                      child: Text(
                        "Update",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            color: greyColor,
                            fontSize: 20,
                            letterSpacing: 0.1),
                      ),
                    )),
              ],
            ),
          )),
    );
  }
}

class AddVitalsTextField extends StatefulWidget {
  const AddVitalsTextField(
      {super.key,
      required this.vitalText,
      required this.labelText,
      required this.textEditingController});
  final String vitalText;
  final String labelText;
  final TextEditingController? textEditingController;

  @override
  State<AddVitalsTextField> createState() => _AddVitalsTextFieldState();
}

class _AddVitalsTextFieldState extends State<AddVitalsTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.vitalText,
            style: GoogleFonts.montserrat(
                color: greyColor, fontSize: 20, letterSpacing: 0.1),
          ),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return "Please enter your vitals";
              }
              return null;
            },
            controller: widget.textEditingController,
            decoration: InputDecoration(
              hintText: widget.labelText,
              hintStyle: GoogleFonts.montserrat(
                  color: ashColor, fontSize: 20, letterSpacing: 0.1),

              isDense: true,
              fillColor: whiteColor,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(25)),
              focusedBorder: InputBorder.none,
              // enabledBorder: InputBorder.none
            ),
          ),
        ],
      ),
    );
  }
}
