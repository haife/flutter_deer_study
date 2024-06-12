// @since 2024/06/12
// @author 乌鸦
// @job Flutter Development
// @des:

import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deer_study/res/colors.dart';
import 'package:flutter_deer_study/res/gaps.dart';
import 'package:flutter_deer_study/res/resources.dart';
import 'package:flutter_deer_study/widgets/load_image.dart';
import 'package:flutter_deer_study/widgets/my_card.dart';

import '../../res/styles.dart';
import '../../util/other_utils.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({super.key, required this.index, required this.tabIndex});

  final int index;
  final int tabIndex;

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Gaps.vGap8,
        MyCard(
            child: Padding(
          padding: EdgeInsets.all(16.0),
          child: InkWell(
            onTap: null,
            child: _buildContent(context),
          ),
        ))
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    final TextStyle? textTextStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: Dimens.font_sp12);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Row(
          children: <Widget>[
            Text(
              '15503048888（郭李）',
              style: TextStyles.textDark,
            ),
            Expanded(child: Gaps.empty),
            Text(
              '货到付款',
              style: TextStyle(color: Colours.red, fontSize: 12),
            ),
          ],
        ),
        Gaps.vGap8,
        const Row(
          children: [
            Text(
              '西安市雁塔区 鱼化寨街道唐兴路唐兴数码3楼318',
              style: TextStyles.textGray12,
            ),
            LoadAssetImage(
              'ic_arrow_right',
              width: 10,
              height: 10,
            )
          ],
        ),
        Gaps.vGap8,
        const Divider(
          height: 0.5,
          color: Colours.line,
        ),
        Gaps.vGap8,
        RichText(
          text: TextSpan(style: textTextStyle, children: [
            const TextSpan(text: '清凉一度抽纸'),
            TextSpan(text: '  x2', style: Theme.of(context).textTheme.titleSmall),
          ]),
        ),
        Gaps.vGap8,
        RichText(
          text: TextSpan(style: textTextStyle, children: [
            const TextSpan(text: '清凉一度抽纸'),
            TextSpan(text: '  x2', style: Theme.of(context).textTheme.titleSmall),
          ]),
        ),
        Gaps.vGap12,
        Row(
          children: <Widget>[
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: textTextStyle,
                  children: <TextSpan>[
                    TextSpan(text: Utils.formatPrice('20.00', format: MoneyFormat.NORMAL)),
                    TextSpan(
                        text: '  共3件商品',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: Dimens.font_sp10)),
                  ],
                ),
              ),
            ),
            const Text(
              '2021.02.05 10:00',
              style: TextStyles.textSize12,
            ),
          ],
        ),
        Gaps.vGap8,
        Gaps.line,
        Gaps.vGap8,
        Row(
          children: <Widget>[],
        )
      ],
    );
  }
}

class OrderItemButton extends StatelessWidget {
  const OrderItemButton({super.key, required this.text, this.baColor, this.textColor, this.onTop});

  final GestureTapCallback? onTop;
  final String text;
  final Color? baColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTop,
      child: Container(

        alignment: Alignment.center,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: baColor,),
      ),
    );
  }
}
