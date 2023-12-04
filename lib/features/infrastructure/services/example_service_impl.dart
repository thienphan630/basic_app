import 'package:basic_app/core/error/failures.dart';
import 'package:basic_app/features/infrastructure/i_service/i_example_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/account_model.dart';

class ExampleService implements IExampleService {
  ExampleService(this._dio);
  final Dio _dio;

  @override
  Future<dynamic> onChangePassword(
      {String? oldPassword,
      String? newPassword,
      String? retypePassword}) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final data = <String, dynamic>{};

    final result = await _dio.request('endpoint',
        queryParameters: queryParameters,
        options: Options(
          method: 'POST',
          headers: <String, dynamic>{},
          extra: extra,
          contentType: 'application/json',
        ),
        data: data);

    return result.data!;
  }

  @override
  Future<Either<Failure, String>> onLogin({String? name, String? password}) {
    // TODO: implement onLogin
    throw UnimplementedError();
  }

  @override
  Future<AccountModel> getAcountInfomation() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final data = <String, dynamic>{};

    final result = await _dio.request('endpoint',
        queryParameters: queryParameters,
        options: Options(
          method: 'POST',
          headers: <String, dynamic>{},
          extra: extra,
          contentType: 'application/json',
        ),
        data: data);

    return AccountModel.fromJson(result.data);
  }
}
