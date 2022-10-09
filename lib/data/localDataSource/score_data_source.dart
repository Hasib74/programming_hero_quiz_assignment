import 'package:shared_preferences/shared_preferences.dart';

class ScoreDataSource {
  SharedPreferences? _sp;

  ScoreDataSource() {
    init();
  }

  init() async {
    _sp = await SharedPreferences.getInstance();
  }

  setScore(String score) {
    _sp!.setString("score", score);
  }

  getScore() {
    return _sp!.getString("score");
  }
}
