import 'package:imbti/models/result_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveResult(ResultModel result) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('mbti_result', result.mbti);
}

Future<String?> getResult() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('mbti_result');
}
