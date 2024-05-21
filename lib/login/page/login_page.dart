import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deer_study/login/login_router.dart';
import 'package:flutter_deer_study/res/constant.dart';
import 'package:flutter_deer_study/res/resources.dart';
import 'package:flutter_deer_study/routers/navigator_utils.dart';
import 'package:flutter_deer_study/util/Utils.dart';
import 'package:flutter_deer_study/widgets/change_notifier_manage.dart';
import 'package:flutter_deer_study/widgets/my_app_bar.dart';
import 'package:flutter_deer_study/widgets/my_button.dart';
import 'package:flutter_deer_study/widgets/my_scroll_view.dart';
import 'package:sp_util/sp_util.dart';
import 'package:flutter_gen/gen_l10n/deer_localizations.dart';

import '../my_text_field.dart';

/// design/1注册登录/index.html
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ChangeNotifieMixin<LoginPage> {
  //定义一个controller
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  bool _clickable = false;

  @override
  Map<ChangeNotifier?, List<VoidCallback>?>? changeNotifier() {
    final List<VoidCallback> callbacks = <VoidCallback>[_verify];
    return <ChangeNotifier, List<VoidCallback>?>{
      _nameController: callbacks,
      _passwordController: callbacks,
      _nodeText1: null,
      _nodeText2: null,
    };
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((during) {
      ///显示状态栏和导航栏
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    });

    _nameController.text = SpUtil.getString(Constant.phone).nullSafe;
  }

  void _verify() {
    final String name = _nameController.text;
    final String password = _passwordController.text;
    bool clickable = true;
    if (name.isEmpty || name.length < 11) {
      clickable = false;
    }
    if (password.isEmpty || password.length < 6) {
      clickable = false;
    }

    /// 状态不一样在setStatus
    if (clickable != _clickable) {
      setState(() {
        _clickable = clickable;
      });
    }
  }

  void _login() {
    SpUtil.putString(Constant.phone, _nameController.text);
    // NavigatorUtils.push(context, StoreRouter.auditPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isBack: false,
        actionName: DeerLocalizations.of(context)!.verificationCodeLogin,
        onPressed: () {
          NavigatorUtils.push(context, LoginRouter.smsLoginPage);
        },
      ),
      body: MyScrollView(
        keyboardConfig: Utils.getKeyboardActionsConfig(context, <FocusNode>[_nodeText1, _nodeText2]),
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        children: _buildBody,
      ),
    );
  }

  List<Widget> get _buildBody => <Widget>[
        Text(
          DeerLocalizations.of(context)!.passwordLogin,
          style: TextStyles.textBold26,
        ),
        Gaps.vGap16,
        MyTextField(
          key: const Key('phone'),
          focusNode: _nodeText1,
          controller: _nameController,
          maxLength: 11,
          keyboardType: TextInputType.phone,
          hintText: DeerLocalizations.of(context)!.inputUsernameHint,
        ),
        Gaps.hGap8,
        MyTextField(
            key: const Key('password'),
            controller: _passwordController,
            keyName: 'password',
            focusNode: _nodeText2,
            isInputPwd: true,
            keyboardType: TextInputType.visiblePassword,
            hintText: DeerLocalizations.of(context)!.inputPasswordHint),
        Gaps.vGap25,
        MyButton(text: DeerLocalizations.of(context)!.login, radius: 4, onPressed: _clickable ? _login : null),
        Container(
          height: 40,
          alignment: Alignment.centerRight,
          child: GestureDetector(
            child: Text(
              DeerLocalizations.of(context)!.noAccountRegisterLink,
              key: const Key('noAccountRegister'),
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            onTap: () => NavigatorUtils.push(context, LoginRouter.registerPage),
          ),
        )
      ];
}
