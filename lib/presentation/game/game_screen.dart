import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programmin_hero/core/utils/app_spaces.dart';
import 'package:programmin_hero/presentation/game/functions/game_functions.dart';
import 'package:programmin_hero/presentation/game/sections/answer_options.dart';
import 'package:programmin_hero/presentation/game/sections/board.dart';
import 'package:programmin_hero/presentation/game/sections/header_question_and_score.dart';
import 'package:programmin_hero/presentation/game/sections/progress.dart';
import 'package:programmin_hero/presentation/game/sections/Timer/timer.dart';

import '../../main.dart';
import 'bloc/game_cubit.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    sl<GameFunctions>().init(context);
    BlocProvider.of<GameCubit>(context).setSelectedOptionsAndCurrectAnswer();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //AppSpaces.spacesHeight15,
            HeaderQuestionAndScore(),
            Progress(),

            AppSpaces.spacesHeight15,
            AnswerTimer(),
            Expanded(child: Board()),
            Expanded(child: AnswerOptions()),
            //  AppSpaces.spacesHeight15,
          ],
        ),
      ),
    );
  }
}
