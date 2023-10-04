// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:imbti/screens/mbti_info_screen.dart';
import 'package:imbti/screens/test_screen.dart';
import 'package:imbti/styles/app_colors.dart';
import 'package:imbti/widgets/main_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            MainButton(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => TestScreen()));
              },
              buttonText: '5분만에 알아보기',
            ),
            SizedBox(height: 20.0),
            MainButton(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => MBTIInfoScreen()));
                },
                buttonText: 'MBTI 대백과사전'),
          ],
        ),
      ),
    );
  }
}
