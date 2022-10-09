import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programmin_hero/core/routes/app_routes.dart';
import 'package:programmin_hero/core/utils/app_spaces.dart';
import 'package:programmin_hero/presentation/game/bloc/game_cubit.dart';
import 'package:programmin_hero/presentation/game/functions/game_functions.dart';
import 'package:programmin_hero/presentation/home/functions/home_functions.dart';

import '../../../main.dart';
import '../widgets/answer_widgets.dart';
import 'Timer/functions/answer_timer_functions.dart';

class AnswerOptions extends StatelessWidget {
  const AnswerOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GameCubit>(context).setSelectedOptionsAndCurrectAnswer();

    return Container(
      child: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          if (state is CurrentQuizState) {
            sl<GameFunctions>().answer =
                sl<HomeFunctions>().quizeModel!.questions![state.index + 1];
          } else {
            sl<GameFunctions>().answer = sl<HomeFunctions>()
                .quizeModel!
                .questions![sl<GameFunctions>().currentQuiz];
          }

          print(
              "Answers..... ${sl<GameFunctions>().answer.answers!.toJson().keys.length}");

          return AbsorbPointer(
            absorbing: sl<GameFunctions>().isAbsor,
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return sl<GameFunctions>()
                            .answer
                            .answers!
                            .toJson()
                            .values
                            .toList()[index] ==
                        null
                    ? Container(
                        child: Text(""),
                      )
                    : AnswerWidgets(
                        options: sl<GameFunctions>()
                            .answer
                            .answers!
                            .toJson()
                            .keys
                            .toList()[index],
                        title: sl<GameFunctions>()
                                .answer
                                .answers!
                                .toJson()
                                .keys
                                .toList()[index] +
                            "    " +
                            sl<GameFunctions>()
                                .answer
                                .answers!
                                .toJson()
                                .values
                                .toList()[index],
                        onClick: () async {
                          if (sl<GameFunctions>().currentQuiz ==
                              sl<HomeFunctions>()
                                      .quizeModel!
                                      .questions!
                                      .length -
                                  1) {
                            BlocProvider.of<GameCubit>(context)
                                .setSelectedOptionsAndCurrectAnswer(
                                    selectedOption: sl<GameFunctions>()
                                        .answer
                                        .answers!
                                        .toJson()
                                        .keys
                                        .toList()[index],
                                    currectAnswer: sl<GameFunctions>()
                                        .answer
                                        .correctAnswer);

                            sl<GameFunctions>().isAbsor = true;

                            await Future.delayed(Duration(seconds: 2));

                            sl<AnswerTimerFuctions>().timer!.cancel();

                            Navigator.pushNamed(
                                context, AppRoutes.RESULT_SCREEN);
                          } else {
                            BlocProvider.of<GameCubit>(context)
                                .setSelectedOptionsAndCurrectAnswer(
                                    selectedOption: sl<GameFunctions>()
                                        .answer
                                        .answers!
                                        .toJson()
                                        .keys
                                        .toList()[index],
                                    currectAnswer: sl<GameFunctions>()
                                        .answer
                                        .correctAnswer);

                            sl<GameFunctions>().isAbsor = true;

                            await Future.delayed(Duration(seconds: 2));

                            BlocProvider.of<GameCubit>(context).setCurrentQuiz(
                                sl<GameFunctions>().currentQuiz + 1);

                            BlocProvider.of<GameCubit>(context)
                                .setSelectedOptionsAndCurrectAnswer();

                            sl<AnswerTimerFuctions>().second = 0;

                            sl<GameFunctions>().isAbsor = false;
                          }
                        },
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return AppSpaces.spacesHeight10;
              },
              itemCount: sl<GameFunctions>()
                  .answer
                  .answers!
                  .toJson()
                  .values
                  .toList()
                  .length,
            ),
          );
        },
      ),
    );
  }
}
