import 'package:flutter/material.dart';
import 'package:imbti/models/result_model.dart';

class ResultScreen extends StatelessWidget {
  final ResultModel resultModel;
  const ResultScreen({super.key, required this.resultModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('MBTI 결과'),
            Text('MBTI: \n${resultModel.mbti}'),
            Text('${resultModel.description}'),
          ],
        ),
      ),
    );
  }
}
