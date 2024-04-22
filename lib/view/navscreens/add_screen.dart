import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const Text("Enable Onboarding"),
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool("onboarding", false);
        },
      ),
    );
  }
}
