import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programmin_hero/presentation/game/functions/game_functions.dart';
import 'package:programmin_hero/presentation/game/sections/Timer/bloc/answer_timer_cubit.dart';
import 'package:programmin_hero/presentation/game/sections/Timer/functions/answer_timer_functions.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../main.dart';
import '../../../home/functions/home_functions.dart';
import '../../bloc/game_cubit.dart';

class AnswerTimer extends StatefulWidget {
  AnswerTimer({Key? key}) : super(key: key);

  @override
  State<AnswerTimer> createState() => _AnswerTimerState();
}

class _AnswerTimerState extends State<AnswerTimer> {
  double? _width;

  Timer? _timer;

  @override
  void dispose() {
    if (_timer!.isActive) {
      _timer!.cancel();
    }

    super.dispose();
  }

  @override
  initState() {
    print("initState Called");

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      BlocProvider.of<AnswerTimerCubit>(context)
          .setTimerSecond(sl<AnswerTimerFuctions>().second += 1);

      if (sl<AnswerTimerFuctions>().second == 15) {
        sl<AnswerTimerFuctions>().second = 0;

        if (sl<GameFunctions>().currentQuiz ==
            sl<HomeFunctions>().quizeModel!.questions!.length - 1) {
          Navigator.pushNamed(context, AppRoutes.RESULT_SCREEN);
        } else {
          BlocProvider.of<GameCubit>(context)
              .setCurrentQuiz(sl<GameFunctions>().currentQuiz + 1);

          BlocProvider.of<GameCubit>(context)
              .setSelectedOptionsAndCurrectAnswer();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width * 0.9;

    return BlocBuilder<AnswerTimerCubit, AnswerTimerState>(
      builder: (context, state) {
        return Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      width: (_width! / sl<AnswerTimerFuctions>().maxSecond!) *
                          sl<AnswerTimerFuctions>().second,
                      child: Container(
                        //width: 0.1,
                        height: 10,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                )),
            Row(
              children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    sl<AnswerTimerFuctions>().second.toString() + "s",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
