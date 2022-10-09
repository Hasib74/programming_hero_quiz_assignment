import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:programmin_hero/domain/model/quize_model.dart';
import 'package:programmin_hero/domain/useCase/quiz_use_case.dart';
import 'package:programmin_hero/presentation/home/bloc/home_cubit.dart';

class HomeFunctions {
  QuizeModel? quizeModel;

  String bestScore = "300";

  Future getAllQuizData(
      void Function(HomeState state) emit, QuizUseCase quizUseCase) async {
    var _res = await quizUseCase.call(GetQuizParms());

    _res.fold((l) {
      print("Response ---- > ${l.body}");
      quizeModel = QuizeModel.fromJson(jsonDecode(l.body!));

      print("Response : ${quizeModel!.questions!.length}");
    }, (r) {
      print("Response : ${r}");

      //ScaffoldMessenger.of(context).me
    });
  }
}
