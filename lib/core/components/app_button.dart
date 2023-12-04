import 'package:basic_app/core/util/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  AppButton(
      {required this.text,
      this.onPress,
      this.prefixIcon,
      this.suffixIcon,
      this.disable = false,
      this.backgroundColor,
      this.borderRadius,
      this.fontSize,
      Key? key,
      this.width,
      this.height})
      : super(key: key);
  final String text;
  final VoidCallback? onPress;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  bool disable;
  double? borderRadius;
  Color? backgroundColor;
  final double? fontSize;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 50,
      child: Container(
        decoration: BoxDecoration(
          color: disable ? Colors.grey : backgroundColor ?? AppColor.kPrimary,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
          // boxShadow: [
          //   BoxShadow(
          //       color: Colors.black26, offset: Offset(2, 2), blurRadius: 2.0)
          // ],
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            surfaceTintColor:
                MaterialStateProperty.resolveWith<Color>((states) {
              return Colors.white; // Defer to the widget's default.
            }),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
              ),
            ),
            minimumSize: MaterialStateProperty.all(const Size(50, 36)),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            // elevation: MaterialStateProperty.all(3),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),

          onPressed: !disable ? onPress : null,
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
          // padding: const EdgeInsets.all(0),
          child: Container(
            constraints: const BoxConstraints(
                minWidth: 88, minHeight: 36), // min sizes for Material buttons
            alignment: Alignment.center,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  prefixIcon ?? Container(),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: fontSize ?? 18,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  suffixIcon ?? Container(),
                ]),
          ),
        ),
      ),
    );
  }
}

class AppWhiteButton extends StatelessWidget {
  const AppWhiteButton(
      {required this.text,
      this.onPress,
      this.icon,
      Key? key,
      this.height,
      this.fontSize,
      this.borderRadius,
      this.width})
      : super(key: key);
  final String text;
  final VoidCallback? onPress;
  final Icon? icon;
  final double? height;
  final double? fontSize;
  final double? borderRadius;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: width,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0.5, color: AppColor.kPrimary),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            surfaceTintColor:
                MaterialStateProperty.resolveWith<Color>((states) {
              return Colors.white; // Defer to the widget's default.
            }),
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 10),
              ),
            ),
            minimumSize: MaterialStateProperty.all(const Size(50, 36)),
            overlayColor:
                MaterialStateProperty.all(Colors.blue.withOpacity(0.2)),
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.white;
              }
              return Colors.transparent; // Defer to the widget's default.
            }),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: onPress,
          child: Container(
              constraints: const BoxConstraints(
                  minWidth: 88,
                  minHeight: 36), // min sizes for Material buttons
              alignment: Alignment.center,
              child: icon != null
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Container(
                            alignment: Alignment.center,
                            width: 40,
                            child: icon,
                          ),
                          Expanded(
                            child: Text(
                              text,
                              style: TextStyle(
                                color: AppColor.kPrimary,
                                fontSize: fontSize ?? 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: 40,
                          ),
                        ])
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Text(
                            text,
                            style: TextStyle(
                                color: AppColor.kPrimary,
                                fontSize: fontSize ?? 18),
                            textAlign: TextAlign.center,
                          )
                        ])),
        ),
      ),
    );
  }
}
