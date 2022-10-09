import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programmin_hero/presentation/game/bloc/game_cubit.dart';
import 'package:programmin_hero/presentation/game/functions/game_functions.dart';
import 'package:programmin_hero/presentation/home/functions/home_functions.dart';

import '../../../main.dart';

class HeaderQuestionAndScore extends StatelessWidget {
  const HeaderQuestionAndScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<GameCubit, GameState>(
            builder: (context, state) {
              return Text(
                "${sl<GameFunctions>().currentQuiz + 1}/${sl<HomeFunctions>().quizeModel!.questions!.length}",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.bold),
              );
            },
          ),
          Column(
            children: [
              Text(
                "Hight Score : " + sl<GameFunctions>().hightScore,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              BlocConsumer<GameCubit, GameState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return Text(
                    "Your Score : " + sl<GameFunctions>().score.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontWeight: FontWeight.bold),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
