// @since 2024/06/11
// @author 乌鸦
// @job Flutter Development
// @des:

import 'package:fluro/fluro.dart';
import 'package:flutter_deer_study/order/page/order_page.dart';
import 'package:flutter_deer_study/routers/i_router.dart';

class OrderRouter implements IRouterProvider {
  static String orderPage = "/order";
  static String orderInfoPage = '/order/info';
  static String orderSearchPage = '/order/search';
  static String orderTrackPage = '/order/track';

  @override
  void initRouter(FluroRouter router) {
    router.define(orderPage, handler: Handler(handlerFunc: (_, __) => const OrderPage()));
  }
}
