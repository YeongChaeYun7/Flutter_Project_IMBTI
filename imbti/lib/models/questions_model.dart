// 질문 모델
class Question {
  final int id; // 질문 id
  final String content; // 질문 내용
  final String answerA; // 답변 A
  final String answerB; // 답변 B
  final String categoryA; // E, S, T, J
  final String categoryB; // I, N, F, P

  Question({
    required this.id,
    required this.content,
    required this.answerA,
    required this.answerB,
    required this.categoryA,
    required this.categoryB,
  });
}

// MBTI 점수를 통해서 MBTI를 반환
class Scoring {
  final Map<String, int> scores = {
    'E': 0,
    'I': 0,
    'S': 0,
    'N': 0,
    'T': 0,
    'F': 0,
    'J': 0,
    'P': 0,
  };

  // MBTI 점수 매기기
  void scoringMBTI(String answer, Question question) {
    if (answer == 'A') {
      scores[question.categoryA] = (scores[question.categoryA] ?? 0) + 1;
    } else {
      scores[question.categoryB] = (scores[question.categoryB] ?? 0) + 1;
    }
  }

  // 큰 점수를 더해서 반환 두 개가 같은 값이면 뒷 문자 반환
  String getResult() {
    String result = '';

    result += (scores['E']! > scores['I']!) ? 'E' : 'I';
    result += (scores['S']! > scores['N']!) ? 'S' : 'N';
    result += (scores['T']! > scores['F']!) ? 'T' : 'F';
    result += (scores['J']! > scores['P']!) ? 'J' : 'P';

    return result;
  }
}
