// @since 2024/06/11
// @author 乌鸦
// @job Flutter Development
// @des:

import 'package:flutter/cupertino.dart';
import 'package:flutter_deer_study/util/theme_utils.dart';
import 'package:flutter_deer_study/widgets/load_image.dart';
import 'package:flutter_deer_study/widgets/my_card.dart';

import '../../res/gaps.dart';

class OrderTagItem extends StatelessWidget {
  const OrderTagItem({super.key, required this.date, required this.orderTotal});

  final String date;
  final int orderTotal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: MyCard(
        child: Container(
          height: 34.0,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: <Widget>[
            const LoadAssetImage('order/icon_calendar',width: 14,height: 14.0,),
              Gaps.hGap10,
              Text(date),
              const Expanded(child: Gaps.empty),
              Text('$orderTotal单')
            ],
          ),
        ),
      ),
    );
  }
}
