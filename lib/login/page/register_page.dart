import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deer_study/login/model/LoginEntity.dart';
import 'package:flutter_deer_study/login/widget/my_text_field.dart';
import 'package:flutter_deer_study/res/styles.dart';
import 'package:flutter_deer_study/routers/navigator_utils.dart';
import 'package:flutter_deer_study/util/toast_utils.dart';
import 'package:flutter_deer_study/widgets/my_app_bar.dart';
import 'package:flutter_deer_study/widgets/my_button.dart';
import 'package:flutter_deer_study/widgets/my_scroll_view.dart';
import 'package:flutter_gen/gen_l10n/deer_localizations.dart';
import 'package:sp_util/sp_util.dart';

import '../../res/gaps.dart';
import '../../widgets/change_notifier_manage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterPageStatus();
  }
}

class _RegisterPageStatus extends State<RegisterPage> with ChangeNotifierMixin<RegisterPage> {
  //定义一个controller
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _vCodeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  bool _clickable = false;

  @override
  Map<ChangeNotifier?, List<VoidCallback>?>? changeNotifier() {
    List<VoidCallback> mCallBack = <VoidCallback>[_verify];
    return <ChangeNotifier, List<VoidCallback>?>{
      _nameController: mCallBack,
      _vCodeController: mCallBack,
      _passwordController: mCallBack,
      _nodeText1: null,
      _nodeText2: null,
      _nodeText3: null,
    };
  }

  void _verify() {
    String name = _nameController.text;
    String vCode = _vCodeController.text;
    String password = _passwordController.text;
    bool clickable = true;
    if (name.isEmpty || name.length < 11) {
      clickable = false;
    }
    if (vCode.isEmpty || vCode.length < 6) {
      clickable = false;
    }
    if (password.isEmpty || password.length < 6) {
      clickable = false;
    }
    if (clickable != _clickable) {
      setState(() {
        _clickable = clickable;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: DeerLocalizations.of(context)!.register),
      body: MyScrollView(
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
        children: _buildBody(),
      ),
    );
  }

  List<Widget> _buildBody() {
    return <Widget>[
      Text(
        DeerLocalizations.of(context)!.openYourAccount,
        style: TextStyles.textBold26,
      ),
      Gaps.vGap16,
      MyTextField(
        key: const Key('phone'),
        focusNode: _nodeText1,
        controller: _nameController,
        maxLength: 11,
        keyboardType: TextInputType.phone,
        hintText: DeerLocalizations.of(context)!.inputPhoneHint,
      ),
      MyTextField(
        key: const Key('vcode'),
        focusNode: _nodeText2,
        controller: _vCodeController,
        maxLength: 6,
        keyboardType: TextInputType.number,
        hintText: DeerLocalizations.of(context)!.inputVerificationCodeHint,
        getVCode: () async {
          if (_nameController.text.length == 11) {
            return true;
          } else {
            return false;
          }
        },
      ),
      MyTextField(
        key: const Key('password'),
        controller: _passwordController,
        focusNode: _nodeText3,
        isInputPwd: true,
        hintText: DeerLocalizations.of(context)!.inputPasswordHint,
        keyboardType: TextInputType.visiblePassword,
      ),
      Gaps.vGap24,
      MyButton(
        key: const Key('register'),
        onPressed: _clickable ? _register : null,
        text: DeerLocalizations.of(context)!.register,
      )
    ];
  }

  void _register() {
    // Navigator.of(context).pop(_nameController.text);
    LoginEntity loginEntity = LoginEntity(phone: _nameController.text, password: _nameController.text);
    NavigatorUtils.goBackWithParams(context, loginEntity);
    Toast.show("注册");
  }
}
