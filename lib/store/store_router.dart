import 'package:fluro/fluro.dart';
import 'package:flutter_deer_study/store/page/store_audit_page.dart';

import '../routers/i_router.dart';

class StoreRouter implements IRouterProvider {
  static String auditPage = '/store/audit';
  static String auditResultPage = '/store/auditResult';

  @override
  void initRouter(FluroRouter router) {
    router.define(auditPage,
        handler: Handler(handlerFunc: (_, __) => const StoreAuditPage()));
    // router.define(auditResultPage, handler: Handler(handlerFunc: (_, __) => const StoreAuditResultPage()));
  }
}
