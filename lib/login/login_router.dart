// @since 2024/05/20
// @author 乌鸦
// @job Flutter Development
// @des:

import 'package:fluro/fluro.dart';
import 'package:flutter_deer_study/login/page/login_page.dart';
import 'package:flutter_deer_study/login/page/register_page.dart';
import 'package:flutter_deer_study/login/page/reset_password_page.dart';
import 'package:flutter_deer_study/login/page/sms_login_page.dart';
import 'package:flutter_deer_study/routers/i_router.dart';

class LoginRouter implements IRouterProvider {
  static String loginPage = '/login';
  static String registerPage = '/login/register';
  static String smsLoginPage = '/login/smsLogin';
  static String resetPasswordPage = '/login/resetPassword';
  static String updatePasswordPage = '/login/updatePassword';

  @override
  void initRouter(FluroRouter router) {
    router.define(loginPage, handler: Handler(handlerFunc: (string, list) => const LoginPage()));
    router.define(registerPage, handler: Handler(handlerFunc: (string, list) => const RegisterPage()));
    router.define(smsLoginPage, handler: Handler(handlerFunc: (string, list) => const SmsLoginPage()));
    router.define(resetPasswordPage, handler: Handler(handlerFunc: (string, list) => const ResetPasswordPage()));
  }
}
