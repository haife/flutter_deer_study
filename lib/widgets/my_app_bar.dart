import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deer_study/util/theme_utils.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(
      {super.key,
      this.backgroundColor,
      this.title = '',
      this.centerTitle = '',
      this.backImg = "assets/images/ic_back_black.png",
      this.backImgColor,
      this.actionName = '',
      this.onPressed,
      this.isBack = true});

  final Color? backgroundColor;
  final String title;
  final String centerTitle;
  final String backImg;
  final Color? backImgColor;
  final String actionName;
  final VoidCallback? onPressed;
  final bool isBack;

  @override
  Widget build(BuildContext context) {
    final Color bgColor = backgroundColor ?? context.backgroundColor;

    final SystemUiOverlayStyle overlayStyle =
        ThemeData.estimateBrightnessForColor(bgColor) == Brightness.dark
            ? ThemeUtils.light
            : ThemeUtils.dark;
    throw UnimplementedError();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
