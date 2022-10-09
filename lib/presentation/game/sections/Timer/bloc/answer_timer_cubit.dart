import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:programmin_hero/presentation/game/sections/Timer/functions/answer_timer_functions.dart';

import '../../../../../main.dart';

part 'answer_timer_state.dart';

class AnswerTimerCubit extends Cubit<AnswerTimerState> {
  AnswerTimerCubit() : super(AnswerTimerInitial());


  setTimerSecond(int time) {
    sl<AnswerTimerFuctions>().setTimerSecond(emit, time);
  }
}
