import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:programmin_hero/main.dart';
import 'package:programmin_hero/presentation/game/functions/game_functions.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameInitial());

  setCurrentQuiz(int index) async {
    sl<GameFunctions>().setCurrentQuiz(index, emit);
  }

  setSelectedOptionsAndCurrectAnswer(
      {String? selectedOption, String? currectAnswer}) {
    sl<GameFunctions>()
        .setSelectedOptionAndCurrectAnswer(selectedOption, currectAnswer, emit);
  }


}
