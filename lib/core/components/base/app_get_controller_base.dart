import 'package:get/get.dart';

enum Status { loading, loadingMore, error, loaded, noData, none }

class AppGetxControllerBase extends GetxController {
  final status = Status.none.obs;

  String errorMessage = '';

  void onLoading([Function()? callback]) {
    if (callback != null) {
      callback();
    } else {
      status.value = Status.loading;
    }
  }

  void onLoadingMore([Function()? callback]) {
    if (callback != null) {
      callback();
    } else {
      status.value = Status.loadingMore;
    }
  }

  void onFinish([Function()? callback]) {
    if (callback != null) {
      callback();
    } else {
      status.value = Status.loaded;
    }
  }

  void onReceivedNoData([Function()? callback]) {
    if (callback != null) {
      callback();
    } else {
      status.value = Status.noData;
    }
  }

  void onError({String? message, Function()? callback}) {
    if (callback != null) {
      callback();
    } else {
      errorMessage = message ?? '';
      status.value = Status.error;
      errorMessage = '';
    }
  }
}
