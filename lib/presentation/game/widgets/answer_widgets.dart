import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:programmin_hero/core/utils/app_colors.dart';
import 'package:programmin_hero/core/utils/app_dimension.dart';
import 'package:programmin_hero/presentation/game/bloc/game_cubit.dart';

class AnswerWidgets extends StatelessWidget {
  VoidCallback? onClick;

  String? title;
  bool? isSelected;
  String? currectAnswer;
  String? options;

  GameState? gameState;

  int? index;

  AnswerWidgets(
      {Key? key,
      this.title: "A. Welcome",
      this.isSelected = false,
      this.options,
      this.currectAnswer,
      this.onClick,
      this.index,
      this.gameState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SetSelectedOptionsAndCurrentAnswerState? _state;
    return InkWell(
      onTap: onClick,
      child: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          if (state is SetSelectedOptionsAndCurrentAnswerState) {
            _state = state;
          }

          return Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: AppDimension.buttonHeight,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                border: Border.all(
                    color: _state == null
                        ? Colors.transparent
                        : _borderColor(_state) ?? Colors.transparent,
                    width: 3),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: AppDimension.spreadRadius,
                      blurRadius: AppDimension.blurRadius)
                ]),
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Text(
                title ?? "",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
          );
        },
      ),
    );
  }

  Color _borderColor(SetSelectedOptionsAndCurrentAnswerState? state) {
    print("state.currectAnswer :: ${state!.currectAnswer}");
    print("state.selectedItems :: ${state.selectedItems}");

    if (state.currectAnswer == null) {
      return Colors.transparent;
    }
    if (state.currectAnswer!.endsWith(options!)) {
      return Colors.green;
    } else if (state.selectedItems!.endsWith(options!) &&
        state.currectAnswer != options) {
      return Colors.red;
    } else {
      return Colors.transparent;
    }
  }
}
