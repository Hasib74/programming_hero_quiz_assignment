import 'package:dartz/dartz.dart';
import 'package:programmin_hero/core/error/failures.dart';
import 'package:programmin_hero/core/remoteHelper/responseHelper/app_api_response.dart';
import 'package:programmin_hero/core/remoteHelper/responseHelper/model/model.dart';
import 'package:programmin_hero/data/remoteDataSource/quiz_data_source.dart';
import 'package:programmin_hero/domain/repository/quiz_repository.dart';

class QuizRepositoryImpl extends QuizRepository {
  QuizRemoteDataSource quizRemoteDataSource;

  QuizRepositoryImpl({required this.quizRemoteDataSource});

  @override
  Future<Either<AppApiResponse<Model>, Failure>> getQuize() {
    return quizRemoteDataSource.getQuize();
  }
}
