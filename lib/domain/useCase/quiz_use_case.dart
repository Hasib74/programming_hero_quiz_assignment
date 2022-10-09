import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:programmin_hero/core/error/failures.dart';
import 'package:programmin_hero/core/remoteHelper/responseHelper/app_api_response.dart';
import 'package:programmin_hero/core/remoteHelper/responseHelper/model/model.dart';
import 'package:programmin_hero/core/useCase/useCase.dart';

import '../repository/quiz_repository.dart';

class QuizUseCase extends UseCase<AppApiResponse, QuizParams> {
  QuizRepository? quizeRepository;

  QuizUseCase({required this.quizeRepository});

  @override
  Future<Either<AppApiResponse<Model>, Failure>> call(QuizParams params) async {
    if (params is GetQuizParms) {
      return quizeRepository!.getQuize();
    } else {
      return Right(UnImplement());
    }
  }
}

class QuizParams extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetQuizParms extends QuizParams {}
