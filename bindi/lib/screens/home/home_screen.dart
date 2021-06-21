import 'package:bindi/components/custom_drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

import 'components/search_dialog.dart';

class HomeScreen extends StatelessWidget {
  openSearch(BuildContext context) async {
    final search = await showDialog(
        context: context,
        builder: (_) => SearchDialog(
              currentSearch: 'Text',
            ));
    print(search);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  openSearch(context);
                })
          ],
        ),
      ),
    );
  }
}
