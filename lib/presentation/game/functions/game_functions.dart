import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:programmin_hero/core/utils/app_colors.dart';
import 'package:programmin_hero/presentation/game/bloc/game_cubit.dart';
import 'package:programmin_hero/presentation/home/functions/home_functions.dart';
import 'package:toast/toast.dart';

import '../../../domain/model/quize_model.dart';
import '../../../main.dart';

class GameFunctions {
  String question = "2/10";
  String hightScore = "300";

  int currentQuiz = 0;

  String? selectedItems;

  String? currectAnswer;

  int score = 0;

  bool isAbsor = false;


  late Questions answer;

  init(BuildContext context) {
    ToastContext().init(context);
  }

  void setCurrentQuiz(int index, void Function(GameState state) emit) {
    currentQuiz = index;

    emit(CurrentQuizState(index));
  }

  void setSelectedOptionAndCurrectAnswer(String? selectedOption,
      String? currectAnswer, void Function(GameState state) emit) {
    this.selectedItems = selectedOption;
    this.currectAnswer = currectAnswer;

    if (selectedItems != null) {
      if (selectedItems!.toString().endsWith(currectAnswer!)) {
        score += int.parse(sl<HomeFunctions>()
            .quizeModel!
            .questions![currentQuiz]
            .score
            .toString());

        Toast.show("Score : ${score}",
            backgroundColor: AppColors.rightColor,
            duration: Toast.lengthShort,
            gravity: Toast.center);
        // Toast.show("Correct answer",
        //     backgroundColor: AppColors.rightColor,
        //     duration: Toast.lengthShort,
        //     gravity: Toast.bottom);
      } else {
        Toast.show(
          "Wrong Answer",
          backgroundColor: AppColors.errorColor,
        );
      }
    }

    emit(SetSelectedOptionsAndCurrentAnswerState(
        selectedItems: selectedItems, currectAnswer: currectAnswer));
  }


}
