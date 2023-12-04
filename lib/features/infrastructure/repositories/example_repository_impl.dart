import 'package:basic_app/core/error/failures.dart';
import 'package:basic_app/features/infrastructure/i_repositories/i_example_repository.dart';
import 'package:basic_app/features/infrastructure/i_service/i_example_service.dart';
import 'package:basic_app/features/infrastructure/models/account_model.dart';
import 'package:dartz/dartz.dart';

import '../../../core/data/datasources/local_storage.dart';

class ExampleRepository implements IExampleRepository {
  final LocalStorage localStorage;
  final IExampleService service;

  ExampleRepository({required this.service, required this.localStorage});

  @override
  Future<Either<Failure, String>> onLogin(
      {String? name, String? password}) async {
    try {
      // final result = await service.onLogin(name: name!, password: password!);
      // final token = result['token'];
      // localStorage.saveAccessToken(token);
      return const Right("token");
    } on Exception catch (exception) {
      return Left(ServerFailure(exception));
    } catch (e) {
      return Left(ServerFailure(Exception(e)));
    }
  }

  @override
  Future<Either<Failure, dynamic>> onChangePassword(
      {String? oldPassword,
      String? newPassword,
      String? retypePassword}) async {
    try {
      final result = await service.onChangePassword(
          oldPassword: oldPassword!,
          newPassword: newPassword!,
          retypePassword: retypePassword!);
      return Right(result);
    } on Exception catch (exception) {
      return Left(ServerFailure(exception));
    } catch (e) {
      return Left(ServerFailure(Exception(e)));
    }
  }

  @override
  Future<Either<Failure, AccountModel>> onGetAccountInformation() async {
    try {
      final result = await service.getAcountInfomation();
      return Right(result);
    } on Exception catch (exception) {
      return Left(ServerFailure(exception));
    } catch (e) {
      return Left(ServerFailure(Exception(e)));
    }
  }
}
