// @since 2024/05/20
// @author 乌鸦
// @job Flutter Development
// @des:

import 'package:flutter/cupertino.dart';
import 'package:flutter_deer_study/res/constant.dart';
import 'package:sp_util/sp_util.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? get locale {
    final String locale = SpUtil.getString(Constant.locale) ?? "";
    switch (locale) {
      case 'zh':
        return const Locale('zh', "CN");
      case 'en':
        return const Locale('en', "US");
      default:
        return null;
    }
  }

  void setLocale(String locale) {
    SpUtil.putString(Constant.locale, locale);
    notifyListeners();
  }
}
