import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deer_study/home/splash_page.dart';
import 'package:flutter_deer_study/res/constant.dart';
import 'package:flutter_deer_study/routers/routers.dart';
import 'package:flutter_deer_study/setting/provider/locale_provider.dart';
import 'package:flutter_deer_study/setting/provider/theme_provider.dart';
import 'package:flutter_deer_study/util/Device.dart';
import 'package:flutter_deer_study/util/handle_error_utils.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:sp_util/sp_util.dart';
import 'package:flutter_gen/gen_l10n/deer_localizations.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  //  debugProfileBuildsEnabled = true;
  //  debugPaintLayerBordersEnabled = true;
  //  debugProfilePaintsEnabled = true;
  //  debugRepaintRainbowEnabled = true;
  if (Constant.inProduction) {
    /// Release环境时不打印debugPrint内容
    debugPrint = (String? message, {int? wrapWidth}) {};
  }

  handleError(() async {
    WidgetsFlutterBinding.ensureInitialized();

    if (Device.isDesktop) {
      await WindowManager.instance.ensureInitialized();
      windowManager.waitUntilReadyToShow().then((_) async {
        /// 隐藏标题栏及操作按钮
        // await windowManager.setTitleBarStyle(
        //   TitleBarStyle.hidden,
        //   windowButtonVisibility: false,
        // );
        /// 设置桌面端窗口大小
        await windowManager.setSize(const Size(400, 800));
        await windowManager.setMinimumSize(const Size(400, 800));

        /// 居中显示
        await windowManager.center();
        await windowManager.show();
        await windowManager.setPreventClose(false);
        await windowManager.setSkipTaskbar(false);
      });
    }

    /// sp初始化
    await SpUtil.getInstance();
    runApp(MyApp());

    /// 隐藏状态栏，导航栏。为启动页、引导页设置全屏显示。完成后还原。
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    // TODO(weilu): 启动体验不佳。状态栏、导航栏在冷启动开始的一瞬间为黑色，且无法通过隐藏、修改颜色等方式进行处理。。。
    // 相关问题跟踪：https://github.com/flutter/flutter/issues/73351
  });
}

class MyApp extends StatelessWidget {
  MyApp({super.key, this.home, this.theme}) {
    Routers.initRoutes();
  }

  final Widget? home;
  final ThemeData? theme;
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Widget app = MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider()), ChangeNotifierProvider(create: (_) => LocaleProvider())],
      child: Consumer2<ThemeProvider, LocaleProvider>(builder: (context, ThemeProvider provider, LocaleProvider localeProvider, _) {
        return _buildMaterialApp(provider, localeProvider);
      }),
    );

    return OKToast(
        backgroundColor: Colors.black54,
        textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.center,
        child: app);
  }

  Widget _buildMaterialApp(ThemeProvider provider, LocaleProvider localeProvider) {
    return MaterialApp(
      // showPerformanceOverlay: true, //显示性能标签
      // debugShowCheckedModeBanner: false, // 去除右上角debug的标签
      // checkerboardRasterCacheImages: true,
      // showSemanticsDebugger: true, // 显示语义视图
      // checkerboardOffscreenLayers: true, // 检查离屏渲染
      title: 'Flutter Deer Study',
      theme: theme ?? provider.getTheme(),
      darkTheme: provider.getTheme(isDarkMode: true),
      themeMode: provider.getThemeMode(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: DeerLocalizations.localizationsDelegates,
      supportedLocales: DeerLocalizations.supportedLocales,
      home: home ?? const SplashPage(),
      locale: localeProvider.locale,
      navigatorKey: navigatorKey,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling), child: child!);
      },
    );
  }
}
