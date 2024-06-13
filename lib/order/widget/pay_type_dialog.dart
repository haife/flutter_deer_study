// @since 2024/06/13
// @author 乌鸦
// @job Flutter Development
// @des:

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deer_study/res/gaps.dart';
import 'package:flutter_deer_study/widgets/base_dialog.dart';
import 'package:flutter_deer_study/widgets/load_image.dart';

import '../../res/dimens.dart';
import '../../routers/navigator_utils.dart';

class PayTypeDialog extends StatefulWidget {
  const PayTypeDialog({super.key, required this.onPressed});

  final void Function(int, String)? onPressed;

  @override
  State<PayTypeDialog> createState() => _PayTypeDialogState();
}

class _PayTypeDialogState extends State<PayTypeDialog> {
  int _value = 0;
  final _list = ['未收款', '支付宝', '微信', '现金'];

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: "收款方式",
      hiddenTitle: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_list.length, (i) => _buildItem(i)),
      ),
      onPress: () {
        NavigatorUtils.goBack(context);
        widget.onPressed?.call(_value, _list[_value]);
      },
    );
  }

  Widget _buildItem(int index) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        child: SizedBox(
          height: 42.0,
          child: Row(
            children: <Widget>[
              Gaps.hGap16,
              Expanded(
                  child: Text(
                _list[index],
                style: _value == index
                    ? TextStyle(fontSize: Dimens.font_sp14, color: Theme.of(context).primaryColor)
                    : null,
              )),
              Visibility(
                  visible: _value == index,
                  child: const LoadAssetImage(
                    'order/ic_check',
                    width: 16.0,
                    height: 16.0,
                  )),
              Gaps.hGap16
            ],
          ),
        ),
        onTap: () => {
          if (mounted)
            {
              setState(() {
                _value = index;
              })
            }
        },
      ),
    );
  }
}
