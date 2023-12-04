import 'package:basic_app/core/components/base/app_get_controller_base.dart';
import 'package:basic_app/core/data/datasources/local_storage.dart';
import 'package:basic_app/features/infrastructure/i_repositories/i_example_repository.dart';
import 'package:basic_app/features/presentation/pages/login/login_screen.dart';
import 'package:get/get.dart';

import '../pages/main_page.dart';

class ExampleController extends AppGetxControllerBase {
  final _authenRep = Get.find<IExampleRepository>();
  void onLogin(String name, String pass) async {
    onLoading();
    final res = await _authenRep.onLogin(name: name, password: pass);
    res.fold((l) {
      onError(
        message: l.toString(),
      );
    }, (r) {
      onFinish();
      Get.off(
        const MainPage(),
      );
    });
  }

  void onChangePassword(
      String oldPassword, String newPassword, String retypePassword) async {}

  onLogout() {
    final LocalStorage localStorage = Get.find();
    localStorage.clearStorage();
    Get.offUntil(
        GetPageRoute(page: () => const LoginScreen()), (route) => false);
  }
}
