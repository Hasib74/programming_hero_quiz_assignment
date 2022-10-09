import 'package:flutter/material.dart';
import 'package:programmin_hero/core/utils/app_spaces.dart';
import 'package:programmin_hero/presentation/game/functions/game_functions.dart';
import 'package:programmin_hero/presentation/result/funtions/result_functions.dart';

import '../../main.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sl<ResultFunctions>().init(context);

    return WillPopScope(
      onWillPop: () async {
        sl<GameFunctions>().score = 0;

        sl<GameFunctions>().currentQuiz = 0;

        return true;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Thank you",
                style: Theme.of(context).textTheme.headline2,
              ),
              AppSpaces.spacesHeight15,
              Text(
                "Your Score: ${sl<GameFunctions>().score}",
                style: Theme.of(context).textTheme.headline1,
              ),
              AppSpaces.spacesHeight15,
              Text(
                "Hight Score: ${sl<GameFunctions>().hightScore}",
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
