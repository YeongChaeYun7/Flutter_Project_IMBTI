
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PersonalityTest(),
    );
  }
}

class PersonalityTest extends StatefulWidget {
  @override
  _PersonalityTestState createState() => _PersonalityTestState();
}

class _PersonalityTestState extends State<PersonalityTest> {
  List<int> MBTI = [0, 0, 0, 0, 0, 0, 0, 0];// 순서대로 E,I,S,N,T,F,J,P 값
  List<int> question = [/* 초기화 */];

  @override
  void initState() {
    super.initState();
  }

// question의 답을 받아 MBTI 계산
  void calculateMBTI() {
    for (int idx = 0; idx < question.length; idx++) {
      int arr = idx % 7;
      if (arr == 0) {
        if (question[idx] == 0) {
          MBTI[0] += 1;
        } else {
          MBTI[1] += 1;
        }
      } else if (0 < arr && arr < 3) {
        if (question[idx] == 0) {
          MBTI[2] += 1;
        } else {
          MBTI[3] += 1;
        }
      } else if (2 < arr && arr < 5) {
        if (question[idx] == 0) {
          MBTI[4] += 1;
        } else {
          MBTI[5] += 1;
        }
      } else {
        if (question[idx] == 0) {
          MBTI[6] += 1;
        } else {
          MBTI[7] += 1;
        }
      }
    }
  }

// 퍼센트 변환. 
  List<int> transPer(List<int> per) {
    List<int> res = [];
    res.add(per[0] * 10);
    res.add(per[1] * 10);
    for (int j = 2; j < per.length; j++) {
      res.add(per[j] * 5);
    }
    return res;
  }


// 최종 MBTI 도출
// 동일 비율일 땐 일단 앞자리 인자 사용 ??????????????????
  String resMBTI(List<int> per) {
    List<String> m = ['E', 'S', 'T', 'J'];
    if (per[0] < per[1]) {
      m[0] = 'I';
    }
    if (per[2] < per[3]) {
      m[1] = 'N';
    }
    if (per[4] < per[5]) {
      m[2] = 'F';
    }
    if (per[6] < per[7]) {
      m[3] = 'P';
    }
    return m.join();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Personality Test'),
      ),
      body: Column(
        children: [
          // Text(f'당신의 MBTI는 {}% 입니다.');
        ],
//         M =trans_per(MBTI)
// print(f'당신은 {res_mbti(trans_per(MBTI))}입니다.')
// print(f'E {M[0]}%, I {M[1]}%,\nS {M[2]}%, N {M[3]}%,\nT {M[4]}%, F {M[5]}%,\nJ {M[6]}%, P {M[7]}%')
      )
    );
  }
}

Map<String, List<String>> mbtiCompatibility = {
  "goodESTJ": ["INTP","ISFP","ISTP","ISFJ"],
  "badESTJ": ["INFP","ENFP","INFJ","ENFJ"],
  "goodESTP": ["ISFJ","ESFJ","ISTJ","ESTJ"],
  "badESTP": ["INFP","ENFP","INFJ","ENFJ"],
  "goodESFJ": ["ISFP","ESFP","ISTP","ESTP"],
  "badESFJ": ["INFP","ENFP","INFJ","ENFJ"],
  "goodESFP": ["ISFJ","ESFJ","ISTJ","ESTJ"],
  "badESFP": ["INFP","ENFP","INFJ","ENFJ"],
  "goodENTJ": ["INTJ","ENTJ","INTP","ENTP"],
  "badENTJ": ["ISFJ","ESFJ","ISTJ","ESTJ"],
  "goodENTP": ["INFJ","ENTJ","INTJ","ENTP"],
  "badENTP": ["ISFJ","ESFJ","ISTJ","ESTJ"],
  "goodENFJ": ["INFP","ENTJ","INTP","ENTP"],
  "badENFJ": ["ESTJ","ESFP","ISTP","ESTP"],
  "goodENFP": ["INFJ","INTJ","INFP","INTJ"],
  "badENFP": ["ESTJ","ESFP","ISTP","ESTP"],
  "goodISTJ": ["ISFP","ESFP","ISTP","ESTP"],
  "badISTJ": ["INFP","ENFP","INFJ","ENFJ"],
  "goodISTP": ["ISFJ","ESFJ","ISTJ","ESTJ"],
  "badISTP": ["INFP","ENFP","INFJ","ENFJ"],
  "goodISFJ": ["ISFP","ESFP","ISTP","ESTP"],
  "badISFJ": ["INFP","ENFP","INFJ","ISFP"],
  "goodISFP": ["ISFJ","ESFJ","ISTJ","ESTJ"],
  "badISFP": ["INFP","ENFP","INFJ","ENFJ"],
  "goodINTJ": ["ENFP","INFJ","ENFJ","INTP"],
  "badINTJ": ["ISFJ","ESFJ","ISTJ","ESTJ"],
  "goodINTP": ["INTJ","ENTJ","INTP","ENTP"],
  "badINTP": ["ISFJ","ESFJ","ISTJ"],
  "goodINFJ": ["INFP","ENTJ","INTP","ENTP"],
  "badINFJ": ["ESTJ","ESFP","ISTP","ESTP"],
  "goodINFP": ["INTJ","ENTJ","INTP","ENTJ"],
  "badINFP": ["ESTJ","ESFP","ISTP","ESTP"],
};