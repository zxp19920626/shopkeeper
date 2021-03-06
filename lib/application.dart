import 'package:dio/dio.dart';
import 'package:fezs_shopkeeper/api/dio_manager.dart';
import 'package:fezs_shopkeeper/event/event_bus.dart';
import 'package:fezs_shopkeeper/redux/app.dart';
import 'package:fezs_shopkeeper/routes/routes.dart';
import 'package:fezs_shopkeeper/utils/log_manager.dart';
import 'package:fezs_shopkeeper/utils/shared_preferences_manager.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluwx/fluwx.dart' as fluwx;

class Application {
  Router router;
  EventBus eventBus;
  SpManager sp;
  Dio dio;
  ScreenUtil screenUtil;

  static final Application application = Application._create();

  factory Application.getInstance() {
    return application;
  }

  Application._create() {
    init();
  }

  init() async {
    _initSp();
    _initRouter();
    _initEventBus();
    _initStatusBarTransparent();
    _initDio();
    _initThirdSdk();
  }

  _initSp() async {
    sp = await SpManager.getInstance();
  }

  _initRouter() {
    var _router = Router();
    Routes.configureRoutes(_router);
    router = _router;
  }

  _initEventBus() {
    eventBus = new EventBus();
  }

  _initStatusBarTransparent() {
    // if (dt.Platform.isAndroid) {
    //   // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    //   SystemUiOverlayStyle systemUiOverlayStyle =
    //       SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    // }
  }

  _initDio() {
    dio = DioManager().dio;
    dio.interceptors.add(LogInterceptor(responseBody: true)); //开启请求日志
  }

  //注册微信 SDK
  _initThirdSdk() async {
    // await fluwx.register(
    //     appId: 'wx572e2c33c466fa27',
    //     doOnAndroid: true,
    //     doOnIOS: true,
    //     enableMTA: false);
    // var result = await fluwx.isWeChatInstalled();
    // LogManager.getInstance().prints('is installed $result');
  }

  void initScreen(BuildContext context) {
    if (screenUtil == null) {
      ScreenUtil.init(context,
          width: 1080, height: 1920, allowFontScaling: true);
      screenUtil = ScreenUtil();
    }
  }

  /**
   * 清理数据缓存
   */
  clearData() {
    store.state.clearState();
  }
}
