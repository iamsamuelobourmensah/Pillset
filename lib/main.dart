import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pill_set/firebase_options.dart';
import 'package:pill_set/model/vital_hive_model.dart';
import 'package:pill_set/view/navscreens/navbar_screen.dart';

import 'package:pill_set/view/widgets/boxes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(VitalsHiveAdapter());
  temperatureBox = await Hive.openBox("temperature");
  
  defaultBoxValues();
  // saturationBox = await Hive.openBox("saturation");
  // pressureBox = await Hive.openBox("pressure");
  // heartRateBox = await Hive.openBox("heartrate");
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool("onboarding") ?? false;
  runApp(MyApp(
    onboarding: onboarding,
  ));
}

class MyApp extends StatelessWidget {
  final bool onboarding;
  const MyApp({super.key, this.onboarding = false});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: onboarding ? const NavBarScreen() : const NavBarScreen(),
    );
  }
}

defaultBoxValues() async {
  // Get the Hive box instance
  temperatureBox = await Hive.openBox<VitalsHive>('temperature');

// Check if the box is empty
  if (temperatureBox.isEmpty) {
    // Set the default values for the VitalsHive objects
    VitalsHive defaultVitals = VitalsHive(
        temperature: '36.2',
        saturation: '99',
        lastUpdated: DateTime.now(),
        pressure: '117/80',
        heartRate: '99');

    // Add the default VitalsHive object to the box
    await temperatureBox.put(0, defaultVitals);
  }
}
