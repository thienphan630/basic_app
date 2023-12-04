import 'package:basic_app/core/util/constants/colors.dart';
import 'package:flutter/material.dart';

class AppCheckBox extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;

  const AppCheckBox({super.key, required this.value, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      activeColor: AppColor.kPrimary,
      side: BorderSide(color: AppColor.kPrimary, width: 0.5),
    );
  }
}
