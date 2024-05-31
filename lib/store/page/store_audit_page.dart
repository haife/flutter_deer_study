import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deer_study/widgets/my_app_bar.dart';
import 'package:flutter_deer_study/widgets/my_scroll_view.dart';

// @since 2024/5/30
// @author 乌鸦
// @job Flutter Development
// @des: 店铺审核

class StoreAuditPage extends StatefulWidget {
  const StoreAuditPage({super.key});

  @override
  State<StoreAuditPage> createState() => _StoreAuditState();
}

class _StoreAuditState extends State<StoreAuditPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        isBack: true,
        centerTitle: "店铺审核资料",
      ),
      body: MyScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [

        ],
      ),
    );
  }
}
