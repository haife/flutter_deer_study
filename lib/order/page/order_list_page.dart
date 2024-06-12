// @since 2024/06/11
// @author 乌鸦
// @job Flutter Development
// @des:

import 'package:flutter/material.dart';
import 'package:flutter_deer_study/order/page/order_item.dart';
import 'package:flutter_deer_study/order/provider/order_page_provider.dart';
import 'package:flutter_deer_study/widgets/change_notifier_manage.dart';
import 'package:flutter_deer_study/widgets/state_layout.dart';
import 'package:provider/provider.dart';
import '../../widgets/my_refresh_list.dart';
import '../widget/order_tag_item.dart';

class OrderListPage extends StatefulWidget {
  final int index;

  const OrderListPage({super.key, required this.index});

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage>
    with AutomaticKeepAliveClientMixin<OrderListPage>, ChangeNotifierMixin<OrderListPage> {
  final ScrollController _controller = ScrollController();
  final StateType _stateType = StateType.loading;
  bool _isLoading = false;
  int _page = 1;
  final int _maxPage = 3;
  int _index = 0;
  List<String> _list = <String>[];

  @override
  void initState() {
    super.initState();
    _index = widget.index;
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NotificationListener(
        onNotification: (ScrollNotification note) {
          if (note.metrics.pixels == note.metrics.maxScrollExtent) {}
          return true;
        },
        child: RefreshIndicator(
            onRefresh: _onRefresh,
            child: Consumer<OrderPageProvider>(
                builder: (_, provider, child) {
                  /// 这里指定controller可以与外层NestedScrollView的滚动分离，避免一处滑动，5个Tab中的列表同步滑动。
                  /// 这种方法的缺点是会重新layout列表
                  return CustomScrollView(
                    controller: _index != provider.index ? _controller : null,
                    key: PageStorageKey<String>('$_index'),
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        ///SliverAppBar的expandedHeight高度,避免重叠
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                      ),
                      child!,
                    ],
                  );
                },
                child: SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: _list.isEmpty
                        ? SliverFillRemaining(child: StateLayout(type: _stateType))
                        : SliverList(delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return index < _list.length
                            ? (index % 5 == 0
                            ? const OrderTagItem(date: '2021年2月5日', orderTotal: 4)
                            : OrderItem(index: index, tabIndex:_index,))
                            : MoreWidget(_list.length, _hasMore(), 10);
                      },
                    ))))));
  }

  @override
  Map<ChangeNotifier?, List<VoidCallback>?>? changeNotifier() {
    return {_controller: null};
  }

  bool _hasMore() {
    return _page < _maxPage;
  }

  @override
  bool get wantKeepAlive => true;

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _page = 1;
        _list = List.generate(10, (i) => 'newItem:$i');
      });
    });
  }
}


