import 'package:dartz/dartz.dart';
import 'package:programmin_hero/core/error/failures.dart';
import 'package:programmin_hero/core/network/app_network.dart';
import 'package:programmin_hero/core/remoteHelper/app_urls.dart';
import 'package:programmin_hero/core/remoteHelper/responseHelper/app_api_response.dart';
import 'package:programmin_hero/core/remoteHelper/responseHelper/model/model.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';

abstract class QuizRemoteDataSource {
  Future<Either<AppApiResponse, Failure>> getQuize();
}

class QuizRemoteDataSourceImpl extends QuizRemoteDataSource {
  @override
  Future<Either<AppApiResponse<Model>, Failure>> getQuize() async {
    if (await sl<AppNetworkInfo>().isConnected) {
      // try {
      //
      // } catch (err) {
      //   print("server error for : ${err.toString()}");
      //   return Right(ServerFailure(err.toString()));
      // }

      http.Response _res = await http.get(Uri.parse(AppUri.quize));

      print("Current _response :: ${_res.body}");

      return Left(AppApiResponse.data(
        response: _res,
      ));
    } else {
      return Right(NoInternetConnection());
    }
  }
}
