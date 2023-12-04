import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final Exception? exception;
  const Failure({required this.exception});
  @override
  List<Object> get props => [];

  @override
  String toString() {
    if (exception != null) {
      return exception.toString().replaceAll('Exception: ', '');
    } else {
      return 'Yêu cầu thất bại.';
    }
  }
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(Exception exception) : super(exception: exception);
}

class CacheFailure extends Failure {
  CacheFailure()
      : super(
          exception: Exception('Vui lòng kiểm tra kết nối mạng và tải lại!'),
        );
}
