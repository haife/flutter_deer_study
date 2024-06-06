// @since 2024/05/27
// @author 乌鸦
// @job Flutter Development
// @des:

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deer_study/login/widget/my_text_field.dart';
import 'package:flutter_deer_study/res/resources.dart';
import 'package:flutter_deer_study/res/styles.dart';
import 'package:flutter_deer_study/routers/navigator_utils.dart';
import 'package:flutter_deer_study/widgets/change_notifier_manage.dart';
import 'package:flutter_deer_study/widgets/my_app_bar.dart';
import 'package:flutter_deer_study/widgets/my_button.dart';
import 'package:flutter_deer_study/widgets/my_scroll_view.dart';
import 'package:flutter_gen/gen_l10n/deer_localizations.dart';

import '../login_router.dart';

class SmsLoginPage extends StatefulWidget {
  const SmsLoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SmsLoginPageState();
  }
}

class _SmsLoginPageState extends State<SmsLoginPage>
    with ChangeNotifierMixin<SmsLoginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _smsCodeController = TextEditingController();
  bool clickAble = false;

  @override
  Map<ChangeNotifier?, List<VoidCallback>?>? changeNotifier() {
    final List<VoidCallback> listCallBack = <VoidCallback>[checkInput];
    return <ChangeNotifier?, List<VoidCallback>?>{
      _nameController: listCallBack,
      _smsCodeController: listCallBack
    };
  }

  void checkInput() {
    var _clickAble = true;
    var name = _nameController.text;
    var smsCode = _smsCodeController.text;
    if (name.isEmpty || name.length < 11) {
      _clickAble = false;
    }
    if (smsCode.isEmpty || smsCode.length < 6) {
      _clickAble = false;
    }
    if (_clickAble != clickAble) {
      setState(() {
        clickAble = _clickAble;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isBack: true,
        onPressed: () {
          NavigatorUtils.goBack(context);
        },
      ),
      body: MyScrollView(
        padding: const EdgeInsets.all(16),
        children: _buildBodyView,
      ),
    );
  }

  List<Widget> get _buildBodyView => <Widget>[
        Text(
          DeerLocalizations.of(context)!.verificationCodeLogin,
          style: TextStyles.textBold26,
        ),
        Gaps.vGap16,
        MyTextField(
            keyboardType: TextInputType.phone,
            hintText: DeerLocalizations.of(context)!.inputPhoneHint,
            controller: _nameController),
        Gaps.vGap16,
        MyTextField(
            keyboardType: TextInputType.number,
            getVCode: () async {
              if (_nameController.text.length == 11) {
                return true;
              } else {
                return false;
              }
            },
            hintText: DeerLocalizations.of(context)!.inputVerificationCodeHint,
            controller: _smsCodeController),
        Gaps.vGap10,
        RichText(
          text: TextSpan(
              text: DeerLocalizations.of(context)!.registeredTips,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: Dimens.font_sp14),
              children: [
                TextSpan(
                    text: DeerLocalizations.of(context)!.register,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //点击注册
                        NavigatorUtils.push(context, LoginRouter.registerPage);
                      })
              ]),
        ),
        Gaps.vGap24,
        MyButton(
            text: DeerLocalizations.of(context)!.login,
            radius: 4,
            onPressed: clickAble ? _login : null),
        Container(
          alignment: Alignment.centerRight,
          height: 40,
          child: GestureDetector(
            child: Text(
              DeerLocalizations.of(context)!.forgotPasswordLink,
            ),
            onTap: () =>
                {NavigatorUtils.push(context, LoginRouter.resetPasswordPage)},
          ),
        )
      ];
}

_login() {}
