// @since 2024/05/20
// @author 乌鸦
// @job Flutter Development
// @des:

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_deer_study/res/constant.dart';
import 'package:flutter_deer_study/util/theme_utils.dart';
import 'package:keyboard_actions/keyboard_actions_config.dart';
import 'package:keyboard_actions/keyboard_actions_item.dart';
import 'package:sp_util/sp_util.dart';

class Utils {
  static KeyboardActionsConfig getKeyboardActionsConfig(BuildContext context, List<FocusNode> list) {
    return KeyboardActionsConfig(
      keyboardBarColor: ThemeUtils.getKeyboardActionsColor(context),
      actions: List.generate(
          list.length,
          (i) => KeyboardActionsItem(
                focusNode: list[i],
                toolbarButtons: [
                  (node) {
                    return GestureDetector(
                      onTap: () => node.unfocus(),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text(getCurrLocale() == 'zh' ? '关闭' : 'Close'),
                      ),
                    );
                  },
                ],
              )),
    );
  }

  static String? getCurrLocale() {
    final String locale = SpUtil.getString(Constant.locale)!;
    if (locale == '') {
      return PlatformDispatcher.instance.locale.languageCode;
    }
    return locale;
  }
}

extension StringExtension on String? {
  String get nullSafe => this ?? '';
}
