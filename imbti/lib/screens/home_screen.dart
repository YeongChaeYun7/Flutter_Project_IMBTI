import 'package:flutter/material.dart';
import 'package:imbti/screens/mbti_info_screen.dart';
import 'package:imbti/screens/test_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => TestScreen()));
              },
              child: Text('5분만에 알아보기'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => MBTIInfoScreen()));
              },
              child: Text('MBTI 정보보기'),
            ),
          ],
        ),
      ),
    );
  }
}
