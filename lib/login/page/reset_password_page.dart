import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deer_study/login/my_text_field.dart';
import 'package:flutter_deer_study/res/resources.dart';
import 'package:flutter_deer_study/widgets/change_notifier_manage.dart';
import 'package:flutter_deer_study/widgets/my_app_bar.dart';
import 'package:flutter_deer_study/widgets/my_button.dart';
import 'package:flutter_deer_study/widgets/my_scroll_view.dart';
import 'package:flutter_gen/gen_l10n/deer_localizations.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<StatefulWidget> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPasswordPage>
    with ChangeNotifierMixin {
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController phoneCodeController = TextEditingController();
  late TextEditingController newPasswordController = TextEditingController();

  late bool isClick = false;

  @override
  Map<ChangeNotifier?, List<VoidCallback>?>? changeNotifier() {
    List<VoidCallback> callBacks = <VoidCallback>[check];
    return <ChangeNotifier?, List<VoidCallback>?>{
      phoneController: callBacks,
      phoneCodeController: callBacks,
      newPasswordController: callBacks,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isBack: true,
        title: DeerLocalizations.of(context)!.forgotPasswordLink,
      ),
      body: MyScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: _buildBody,
      ),
    );
  }

  List<Widget> get _buildBody => [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 31),
          child: Text(
            DeerLocalizations.of(context)!.resetLoginPassword,
            style: TextStyles.textBold26,
          ),
        ),
        Gaps.vGap32,
        MyTextField(
          maxLength: 11,
          controller: phoneController,
          hintText: DeerLocalizations.of(context)!.inputUsernameHint,
          keyboardType: TextInputType.phone,
        ),
        Gaps.vGap10,
        MyTextField(
          maxLength: 6,
          controller: phoneCodeController,
          hintText: DeerLocalizations.of(context)!.getVerificationCode,
          getVCode: () async {
            return phoneCodeController.text.length == 11 ? true : false;
          },
        ),
        Gaps.vGap10,
        MyTextField(
          controller: newPasswordController,
          hintText: "请输入新密码",
          isInputPwd: true,
        ),
        Gaps.vGap25,
        MyButton(
          onPressed: isClick ? resetPassword : null,
          text: DeerLocalizations.of(context)!.confirm,
        )
      ];

  void check() {
    String number = phoneController.text;
    String phoneCode = phoneCodeController.text;
    String newPassword = newPasswordController.text;
    bool _isClick = true;
    if (number.isEmpty || number.length < 11) {
      _isClick = false;
    }
    if (phoneCode.isEmpty || phoneCode.length < 6) {
      _isClick = false;
    }
    if (newPassword.isEmpty || newPassword.length < 6) {
      _isClick = false;
    }
    if (_isClick != isClick) {
      setState(() {
        isClick = _isClick;
      });
    }
  }

  resetPassword() {}
}
