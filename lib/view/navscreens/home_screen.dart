import 'package:flutter/material.dart';
import 'package:pill_set/view/widgets/home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
             CalenderWidget()
          ],
        ),
      )
    );
  }
}