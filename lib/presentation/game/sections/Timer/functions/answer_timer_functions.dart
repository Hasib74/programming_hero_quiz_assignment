import 'package:programmin_hero/presentation/game/sections/Timer/bloc/answer_timer_cubit.dart';

class AnswerTimerFuctions {


  int? maxSecond = 15;

  int second = 0;

  void setTimerSecond(void Function(AnswerTimerState state) emit, int time) {
    emit(SetTimerValueState(time));
  }
}
