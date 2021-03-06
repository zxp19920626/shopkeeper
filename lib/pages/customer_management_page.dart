import 'package:fezs_shopkeeper/application.dart';
import 'package:fezs_shopkeeper/bean/js_qrcode_bean.dart' as jsQrcode;
import 'package:fezs_shopkeeper/mixin/toast_mixin.dart';
import 'package:fezs_shopkeeper/redux/app.dart';
import 'package:fezs_shopkeeper/utils/js_receive_manager.dart';
import 'package:fezs_shopkeeper/values/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'dart:convert' as convert;

class CustomerManagementPage extends StatefulWidget {
  @override
  _CustomerManagementPageState createState() => _CustomerManagementPageState();
}

class _CustomerManagementPageState extends State<CustomerManagementPage>
    with AutomaticKeepAliveClientMixin, ToastMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("客户管理"),
        centerTitle: true,
      ),
      body: StoreProvider(
        store: store,
        child: StreamBuilder(
            stream: null,
            builder: (context, snapdate) {
              return GestureDetector(
                onTap: () {
                  // jsQrcode.JsQrcodeBean autogenerated = jsQrcode.JsQrcodeBean();
                  // jsQrcode.Data data = jsQrcode.Data();
                  // data.qrcode = "aaaaa";
                  // autogenerated.data = data;

                  // JsReceiveManager.getInstance()
                  //     .receiveMsg(convert.jsonEncode(autogenerated));

                  // JsSendManager.getInstance().send3003("qrcode", (msg) {
                  //   showToast(msg);
                  // });

                  // jsQrcode.JsQrcodeBean autogenerated =
                  //     jsQrcode.JsQrcodeBean(type: 1001);
                  // jsQrcode.Data data = jsQrcode.Data();
                  // data.token = "aaaaa";
                  // autogenerated.data = data;
                  // JsReceiveManager.getInstance().receiveMsg(
                  //     convert.jsonEncode(autogenerated), (type, imgs) {
                  //   switch (type) {
                  //     case 1001:
                  //       setState(() {
                  //         List<Asset> a = imgs;
                  //         showToast(a.toString());
                  //       });
                  //       break;
                  //     default:
                  //   }
                  // });

                  // jsQrcode.JsQrcodeBean autogenerated =
                  //     jsQrcode.JsQrcodeBean(type: 1002);
                  // jsQrcode.Data data = jsQrcode.Data();
                  // data.token = "aaaaa";
                  // autogenerated.data = data;
                  // JsReceiveManager.getInstance().receiveMsg(
                  //     context, convert.jsonEncode(autogenerated), null);

                  Application.getInstance().clearData();
                  showToast("清除用户信息");
                },
                child: Center(
                  child: Text("客户管理", style: TvStyle.style_777777_72),
                ),
              );
            }),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
