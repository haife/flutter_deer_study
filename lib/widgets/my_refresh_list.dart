// @since 2024/06/11
// @author 乌鸦
// @job Flutter Development
// @des:

import 'package:flutter/cupertino.dart';
import 'package:flutter_deer_study/res/resources.dart';
import 'package:flutter_deer_study/util/theme_utils.dart';

class MoreWidget extends StatelessWidget {
  const MoreWidget(this.length, this.hasMore, this.pageSize, {super.key});

  final int length;
  final int pageSize;
  final bool hasMore;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = context.isDark ? TextStyles.textGray14 : const TextStyle(color: Color(0x8A000000));
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (hasMore) const CupertinoActivityIndicator(),
          if (hasMore) Gaps.hGap5,
          Text(
            hasMore ? '正在加载中...' : (length < pageSize ? '' : "没有了哟～"),
            style: textStyle,
          )
        ],
      ),
    );
  }
}
