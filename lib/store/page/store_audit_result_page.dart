// @since 2024/06/06
// @author 乌鸦
// @job Flutter Development
// @des:

import 'package:flutter/material.dart';
import 'package:flutter_deer_study/res/resources.dart';
import 'package:flutter_deer_study/routers/routers.dart';
import 'package:flutter_deer_study/widgets/my_app_bar.dart';
import 'package:flutter_deer_study/widgets/my_button.dart';
import 'package:flutter_deer_study/widgets/my_scroll_view.dart';

import '../../routers/navigator_utils.dart';
import '../../widgets/load_image.dart';

class StoreAuditResultPage extends StatefulWidget {
  const StoreAuditResultPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StoreAuditResultPageState();
  }
}

class _StoreAuditResultPageState extends State<StoreAuditResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "店铺审核资料", isBack: true),
      body: MyScrollView(
        children: buildBody(),
      ),
    );
  }

  List<Widget> buildBody() {
    return <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Gaps.vGap50,
          const LoadAssetImage(
            'store/icon_success',
            width: 80.0,
            height: 80.0,
          ),
          Gaps.vGap24,
          const Text(
            '恭喜，店铺资料审核成功',
            style: TextStyle(color: Colours.text, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          Gaps.vGap12,
          Text(
            '2021-02-21 15:20:10',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Gaps.vGap8,
          Text(
            '5秒后进入主页面',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Gaps.vGap24,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MyButton(
                text: "进入",
                onPressed: () {
                  NavigatorUtils.push(context, Routers.home, clearStack: true);
                }),
          ),
        ],
      )
    ];
  }
}
