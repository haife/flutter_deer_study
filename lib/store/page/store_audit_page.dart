// @since 2024/06/05
// @author 乌鸦
// @job Flutter Development
// @des:

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deer_study/res/resources.dart';
import 'package:flutter_deer_study/widgets/my_button.dart';
import 'package:image_picker/image_picker.dart';

import '../../routers/navigator_utils.dart';
import '../../widgets/my_app_bar.dart';
import '../../widgets/my_scroll_view.dart';
import '../../widgets/selected_image.dart';
import '../../widgets/selected_item.dart';
import '../../widgets/text_field_item.dart';

class StoreAuditPage extends StatefulWidget {
  const StoreAuditPage({super.key});

  @override
  _StoreAuditPageState createState() {
    return _StoreAuditPageState();
  }
}

class _StoreAuditPageState extends State<StoreAuditPage> {
  final GlobalKey<SelectedImageState> _imageGlobalKey = GlobalKey<SelectedImageState>();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  final FocusNode _nodeText3 = FocusNode();
  final ImagePicker picker = ImagePicker();
  String _address = '陕西省 西安市 雁塔区 高新六路201号';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        centerTitle: '店铺审核资料',
      ),
      body: MyScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        tapOutsideToDismiss: true,
        bottomButton: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
          child: MyButton(
            onPressed: () {},
            text: '提交',
          ),
        ),
        children: buildBody(),
      ),

      /// 同时存在底部按钮与keyboardConfig配置时，为保证Android与iOS平台软键盘弹出高度正常，添加下面的代码。
      resizeToAvoidBottomInset: defaultTargetPlatform != TargetPlatform.iOS,
    );
  }

  /// method_name
  /// description TODO
  ///  构建主体布局
  List<Widget> buildBody() => <Widget>[
        Gaps.vGap5,
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text('店铺资料', style: TextStyles.textBold18),
        ),
        Gaps.vGap16,
        Center(
          child: SelectedImage(
            key: _imageGlobalKey,
          ),
        ),
        Gaps.vGap10,
        Center(
          child: Text(
            '店主手持身份证或营业执照',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: Dimens.font_sp14),
          ),
        ),
        Gaps.vGap16,
        TextFieldItem(
          focusNode: _nodeText1,
          title: '店铺名称',
          hintText: '填写店铺名称',
        ),
        SelectedItem(
          title: '主营范围',
          content: _sortName,
          onTap: () {
            showBottomSheet();
          },
        ),
        SelectedItem(
          title: '店铺地址',
          content: _address,
          onTap: () {},
        ),
        Gaps.vGap32,
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text('店主信息', style: TextStyles.textBold18),
        ),
        Gaps.vGap16,
        TextFieldItem(focusNode: _nodeText2, title: '店主姓名', hintText: '填写店主姓名'),
        TextFieldItem(focusNode: _nodeText3, keyboardType: TextInputType.phone, title: '联系电话', hintText: '填写店主联系电话')
      ];

  String _sortName = '';
  final List<String> _list = ['水果生鲜', '家用电器', '休闲食品', '茶酒饮料', '美妆个护', '粮油调味', '家庭清洁', '厨具用品', '儿童玩具', '床上用品'];

  void showBottomSheet() {
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return DraggableScrollableSheet(
              key: const Key("goods_sorts"),
              initialChildSize: 0.7,
              minChildSize: 0.65,
              expand: false,
              builder: (context, scrollController) {
                return ListView.builder(
                  itemExtent: 48,
                  controller: scrollController,
                  itemBuilder: (_, index) {
                    return InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.centerLeft,
                        child: Text(_list[index]),
                      ),
                      onTap: () {
                        setState(() {
                          _sortName = _list[index];
                        });
                        NavigatorUtils.goBack(context);
                      },
                    );
                  },
                  itemCount: _list.length,
                );
              });
        });
  }
}
