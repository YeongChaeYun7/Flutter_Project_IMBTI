// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:imbti/const/description_map.dart';
import 'package:imbti/const/question_list.dart';
import 'package:imbti/models/questions_model.dart';
import 'package:imbti/models/result_model.dart';
import 'package:imbti/screens/reulst_screen.dart';
import 'package:imbti/widgets/main_drawer.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  // 체크가 둘 중에 하나라도 되었는지 확인
  List<bool> isChecked = List<bool>.filled(questionList.length, false);
  // A 답변을 골랐는지 확인
  List<bool> isAChecked = List<bool>.filled(questionList.length, false);
  // B 답변을 골랐는지 확인
  List<bool> isBChecked = List<bool>.filled(questionList.length, false);
  // AnswerModel answerA =
  //     AnswerModel(answer: List<bool>.filled(questionList.length, false));
  final PageController _pageController = PageController();

  Scoring scoring = Scoring();
  @override
  Widget build(BuildContext context) {
    bool allAnswered = true;

    for (int i = 0; i < questionList.length; i++) {
      if (!(isAChecked[i] || isBChecked[i])) {
        allAnswered = false;
        break;
      }
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: Colors.black,
      ),
      drawer: MainDrawer(
        pageController: _pageController,
        isChecked: isChecked,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: questionList.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('문제 ${index + 1}'),
                      Card(
                        child: Column(
                          children: [
                            Text(questionList[index].content),
                            ListTile(
                              leading: Checkbox(
                                value: isAChecked[index],
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      isBChecked[index] = false;
                                    }
                                    isAChecked[index] = value!;
                                    scoring.scoringMBTI(
                                        'A', questionList[index]);
                                    _pageController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeIn,
                                    );
                                    isChecked[index] = value;
                                  });
                                },
                              ),
                              title: Text(questionList[index].answerA),
                            ),
                            ListTile(
                              leading: Checkbox(
                                value: isBChecked[index],
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      isAChecked[index] = false;
                                    }
                                    isBChecked[index] = value!;
                                    scoring.scoringMBTI(
                                        'B', questionList[index]);
                                    _pageController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeIn,
                                    );
                                    isChecked[index] = value;
                                  });
                                },
                              ),
                              title: Text(questionList[index].answerB),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            if (allAnswered)
              ElevatedButton(
                onPressed: () {
                  final result = scoring.getResult();
                  // print(result);
                  ResultModel resultModel = ResultModel(
                      mbti: result, description: description[result]);
                  // print(resultModel.mbti);
                  // print(resultModel.description);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              ResultScreen(resultModel: resultModel)));
                },
                child: Text('결과보기'),
              ),
          ],
        ),
      ),
    );
  }
}
