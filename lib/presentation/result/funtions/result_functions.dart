import 'package:flutter/material.dart';
import 'package:programmin_hero/data/localDataSource/score_data_source.dart';
import 'package:programmin_hero/presentation/game/functions/game_functions.dart';

import '../../../main.dart';

class ResultFunctions {
  BuildContext? context;

  init(BuildContext context) {
    this.context = context;

    var _highScore = sl<ScoreDataSource>().getScore();

    if (_highScore == null) {
      sl<ScoreDataSource>().setScore(sl<GameFunctions>().score.toString());

      sl<GameFunctions>().hightScore = sl<GameFunctions>().score.toString();
    } else {
      if (int.parse(sl<GameFunctions>().score.toString()) >
          int.parse(_highScore)) {
        sl<ScoreDataSource>().setScore(sl<GameFunctions>().score.toString());

        sl<GameFunctions>().hightScore = sl<GameFunctions>().score.toString();
      }
    }
  }
}
