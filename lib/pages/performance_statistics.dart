import 'package:fezs_shopkeeper/mixin/toast_mixin.dart';
import 'package:fezs_shopkeeper/redux/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class PerformanceStatisticsPage extends StatefulWidget {
  @override
  _PerformanceStatisticsPageState createState() => _PerformanceStatisticsPageState();
}

class _PerformanceStatisticsPageState extends State<PerformanceStatisticsPage>
    with AutomaticKeepAliveClientMixin, ToastMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("业绩统计"),
        centerTitle: true,
      ),
      body: StoreProvider(
        store: store,
        child: StreamBuilder(
            stream: null,
            builder: (context, snapdate) {
              return Text("业绩统计");
            }),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
