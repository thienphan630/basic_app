import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:isa/core/components/app_snackbar.dart';

import '../progress_dialog.dart';
import 'app_get_controller_base.dart';

class AppStatusBaseScreen extends StatefulWidget {
  const AppStatusBaseScreen(
      {super.key, required this.controller, required this.child});
  final AppGetxControllerBase controller;
  final Widget child;

  @override
  State<AppStatusBaseScreen> createState() => _AppStatusBaseScreenState();
}

class _AppStatusBaseScreenState extends State<AppStatusBaseScreen> {
  final _isShow = false.obs;
  StreamSubscription? subStatus;
  @override
  void initState() {
    super.initState();
    final progressDialog = ProgressDialog(context,
        blur: 2,
        dismissable: false,
        backgroundColor: const Color(0x33000000),
        animationDuration: const Duration(milliseconds: 500));

    subStatus = widget.controller.status.listen((p0) {
      _isShow.value = p0 == Status.loading;
      if (p0 == Status.loading) {
        progressDialog.show();
      } else {
        progressDialog.dismiss();
      }
    });
  }

  @override
  void dispose() {
    subStatus?.cancel();
    _isShow.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
