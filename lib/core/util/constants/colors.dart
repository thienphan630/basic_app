import 'dart:ui';

class AppColor {
  // #region colors appbar
  static Color kPrimary = const Color(0xff0A81AC); //appbar
  // #endregion

  // #region Color appbar light
  static Color kPrimaryDart = const Color(0xff075673); //appbar
  // #endregion

  // #region Color background
  // static Color color3 = const Color(0xFFEDEDF1); //background color
  static Color kBackground = const Color(0xFFF5F5F5); //background color

  // #region Color text main
  static Color kText = const Color(0xFF444BA5); //text main
  // #endregion

  // #region Color text main
  static Color color9 = const Color(0xFFEDEDED); //text main.

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
