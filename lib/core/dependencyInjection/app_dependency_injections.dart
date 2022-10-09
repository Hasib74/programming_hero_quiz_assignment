import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:programmin_hero/core/network/app_network.dart';
import 'package:programmin_hero/data/localDataSource/score_data_source.dart';
import 'package:programmin_hero/data/remoteDataSource/quiz_data_source.dart';
import 'package:programmin_hero/data/respository/quiz_repository_impl.dart';
import 'package:programmin_hero/domain/useCase/quiz_use_case.dart';
import 'package:programmin_hero/main.dart';
import 'package:programmin_hero/presentation/result/funtions/result_functions.dart';
import 'package:programmin_hero/presentation/splash/functions/splash_screen_functions.dart';

import '../../presentation/game/functions/game_functions.dart';
import '../../presentation/game/sections/Timer/functions/answer_timer_functions.dart';
import '../../presentation/home/functions/home_functions.dart';

Future intiGetIt() async {
  //Functions
  sl.registerSingleton(SplashScreenFunctions());
  sl.registerSingleton(HomeFunctions());
  sl.registerSingleton(GameFunctions());
  sl.registerSingleton(ResultFunctions());
  sl.registerSingleton(AnswerTimerFuctions());
  sl.registerSingleton<ScoreDataSource>(ScoreDataSource());
  sl.registerSingleton<AppNetworkInfo>(NetworkInfoImpl(Connectivity()));

  sl.registerLazySingleton(() => QuizUseCase(
      quizeRepository: QuizRepositoryImpl(quizRemoteDataSource: sl())));

  sl.registerSingleton<QuizRemoteDataSource>(QuizRemoteDataSourceImpl());

//  sl.registerSingleton<Qu>(instance)

  // sl.registerSingleton<>(instance)
}
