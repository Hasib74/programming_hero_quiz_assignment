import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:programmin_hero/presentation/home/functions/home_functions.dart';

import '../../../domain/useCase/quiz_use_case.dart';
import '../../../main.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  QuizUseCase quizUseCase;

  HomeCubit({required this.quizUseCase}) : super(HomeInitial());

  Future getQuizData() async {
    return sl<HomeFunctions>().getAllQuizData(emit, quizUseCase);
  }
}
