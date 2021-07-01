import 'package:bindi/screens/account/account_screen.dart';
import 'package:bindi/screens/create/create_screen.dart';
import 'package:bindi/screens/favorites/favorites_screen.dart';
import 'package:bindi/screens/home/home_screen.dart';
import 'package:bindi/screens/offline/offline_screen.dart';
import 'package:bindi/stores/connectivity_store.dart';
import 'package:bindi/stores/page_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();

  final PageStore pageStore = GetIt.I<PageStore>();
  final ConnectivityStore connectivityStore = GetIt.I<ConnectivityStore>();

  @override
  void initState() {
    super.initState();
    reaction((_) => pageStore.page, (page) => pageController.jumpToPage(page));

    autorun((_) {
      if (!connectivityStore.connected) {
        Future.delayed(Duration(milliseconds: 50)).then(
          (value) =>
              showDialog(context: context, builder: (_) => OfflineScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          CreateScreen(),
          Container(
            color: Colors.red,
          ),
          FavoritesScreen(),
          AccountScreen(),
        ],
      ),
    );
  }
}
