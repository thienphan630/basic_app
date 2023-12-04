import 'package:basic_app/features/bindings/app_bindings.dart';
import 'package:flutter/material.dart';

import 'package:basic_app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppBinding().dependencies();
  runApp(const MainApp());
}
