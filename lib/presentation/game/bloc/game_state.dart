part of 'game_cubit.dart';

abstract class GameState extends Equatable {
  const GameState();
}

class GameInitial extends GameState {
  @override
  List<Object> get props => [];
}

class CurrentQuizState extends GameState {
  int index;

  CurrentQuizState(this.index) {
    print("Index ===> ${index}");
  }

  @override
  // TODO: implement props
  List<Object?> get props => [index];
}

class SetSelectedOptionsAndCurrentAnswerState extends GameState {
  String? selectedItems;

  String? currectAnswer;

  SetSelectedOptionsAndCurrentAnswerState(
      {this.currectAnswer, this.selectedItems}) {
    print("Index ===> current answer $currectAnswer");
    print("Index ===> selected items $selectedItems");
  }

  @override
  // TODO: implement props
  List<Object?> get props => [selectedItems, currectAnswer];
}


