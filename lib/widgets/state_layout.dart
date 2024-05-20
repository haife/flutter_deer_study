// @since 2024/05/20
// @author 乌鸦
// @job Flutter Development
// @des:

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deer_study/util/theme_utils.dart';

import '../res/dimens.dart';
import '../res/gaps.dart';
import 'load_image.dart';

class StateLayout extends StatelessWidget {
  const StateLayout({super.key, required this.type, this.hintText});

  final StateType type;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (type == StateType.loading)
          const CupertinoActivityIndicator(radius: 16.0)
        else if (type != StateType.empty)
          Opacity(
            opacity: context.isDark ? 0.5 : 1,
            child: LoadAssetImage(
              'state/${type.img}',
              width: 120,
            ),
          ),
        const SizedBox(
          width: double.infinity,
          height: Dimens.gap_dp16,
        ),
        Text(
          hintText ?? type.hintText,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: Dimens.font_sp14),
        ),
        Gaps.vGap50,
      ],
    );
  }
}

enum StateType {
  /// 订单
  order,

  /// 商品
  goods,

  /// 无网络
  network,

  /// 消息
  message,

  /// 无提现账号
  account,

  /// 加载中
  loading,

  /// 空
  empty
}

extension StateTypeExtension on StateType {
  String get img => <String>['zwdd', 'zwsp', 'zwwl', 'zwxx', 'zwzh', '', ''][index];

  String get hintText => <String>['暂无订单', '暂无商品', '无网络连接', '暂无消息', '马上添加提现账号吧', '', ''][index];
}
