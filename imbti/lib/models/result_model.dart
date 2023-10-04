// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResultModel {
  final String mbti; // mbti 결과
  final String description; // mbti 설명
  final DateTime timeStamp = DateTime.now();

  ResultModel({
    required this.mbti,
    required this.description,
  });
}
