import 'package:bindi/stores/myads_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'components/active_tile.dart';

class MyAdsScreenn extends StatefulWidget {
  @override
  _MyAdsScreennState createState() => _MyAdsScreennState();
}

class _MyAdsScreennState extends State<MyAdsScreenn>
    with SingleTickerProviderStateMixin {
  final MyAdsStore store = MyAdsStore();

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Anúncios'),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.orange,
          tabs: [
            Tab(child: Text('ATIVOS')),
            Tab(child: Text('PENDENTES')),
            Tab(child: Text('VENDIDOS')),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Observer(builder: (_) {
            if (store.activeAds.isEmpty) return Container();
            return ListView.builder(
              itemCount: store.activeAds.length,
              itemBuilder: (_, index) {
                return ActiveTile(store.activeAds[index]);
              },
            );
          }),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}