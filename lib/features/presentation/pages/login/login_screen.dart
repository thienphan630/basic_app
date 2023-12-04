import 'package:basic_app/core/components/app_button.dart';
import 'package:basic_app/core/components/app_text_field.dart';
import 'package:basic_app/core/components/base/app_status_base_screen.dart';
import 'package:basic_app/core/util/constants/colors.dart';
import 'package:basic_app/features/presentation/controllers/example_controller.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  final _loginController = ExampleController();

  @override
  void dispose() {
    _nameEditingController.clear();
    _passwordEditingController.clear();
    _loginController.dispose();
    super.dispose();
  }

  bool isEmailCorrect = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AppStatusBaseScreen(
      controller: _loginController,
      child: Scaffold(
        backgroundColor: AppColor.kBackground,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // logo here
                  // Image.asset(
                  //   'assets/images/logo_new.png',
                  //   height: 120,
                  //   width: 120,
                  // ),
                  // const SizedBox(
                  //   height: 50,
                  // ),
                  Text(
                    'Example',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: AppColor.kPrimary,
                    ),
                  ),
                  // const Icon(
                  //   Icons.logo_dev,
                  //   size: 120,
                  // ),
                  Text(
                    'description',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: AppColor.kPrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Đăng nhập',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColor.kPrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),

                  Text(
                    'Vui lòng đăng nhập vào ứng dụng',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w300,
                        // height: 1.5,
                        fontSize: 15),
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20, top: 20),
                            child: AppTextField(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              controller: _nameEditingController,
                              labelText: 'Tài khoản',
                              hintText: 'Nhập tên đăng nhập',
                              maxLength: 35,
                              prefixIcon: Icon(
                                Icons.person,
                                color: AppColor.kPrimary,
                                size: 30,
                              ),
                              showClear: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Vui lòng nhập tên đăng nhập';
                                }
                                return null;
                              },
                              onChanged: (val) {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: AppTextField(
                              obscureText: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              controller: _passwordEditingController,
                              labelText: "Mật khẩu",
                              maxLength: 35,
                              showClear: true,
                              keyboardType: TextInputType.visiblePassword,
                              hintText: 'Nhập nhập khẩu',
                              prefixIcon: Icon(
                                Icons.key,
                                color: AppColor.kPrimary,
                                size: 30,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Vui lòng nhập mật khẩu';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 20),
                            child: AppButton(
                              text: 'Đăng nhập',
                              onPress: () {
                                FocusManager.instance.primaryFocus?.unfocus();

                                if (_formKey.currentState!.validate()) {
                                  _loginController.onLogin(
                                      _nameEditingController.text,
                                      _passwordEditingController.text);
                                }
                                // Get.to(const MainPage());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
