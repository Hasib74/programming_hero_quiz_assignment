part of 'answer_timer_cubit.dart';

abstract class AnswerTimerState extends Equatable {
  const AnswerTimerState();
}

class AnswerTimerInitial extends AnswerTimerState {
  @override
  List<Object> get props => [];
}


class SetTimerValueState extends AnswerTimerState {
  int? second;

  SetTimerValueState(this.second);

  @override
  // TODO: implement props
  List<Object?> get props => [second];
}