import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deer_study/res/colors.dart';

class ThemeUtils {
  static bool isDark(BuildContext context) {
    return Theme
        .of(context)
        .brightness == Brightness.dark;
  }

  static const SystemUiOverlayStyle light = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colours.dark_bg_color,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
  );

  static const SystemUiOverlayStyle dark = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  );

  static Color? getKeyboardActionsColor(BuildContext context) {
    return isDark(context) ? Colours.dark_bg_color : Colors.grey[200];
  }


}

extension ThemeExtension on BuildContext {
  bool get isDark => ThemeUtils.isDark(this);

  Color get backgroundColor =>
      Theme
          .of(this)
          .scaffoldBackgroundColor;

  Color get dialogBackgroundColor =>
      Theme
          .of(this)
          .canvasColor;
}
