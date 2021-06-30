import 'package:bindi/screens/login/login_screen.dart';
import 'package:bindi/stores/page_store.dart';
import 'package:bindi/stores/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'PageTile.dart';

class PageSection extends StatelessWidget {
  final PageStore pageStore = GetIt.I<PageStore>();
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();
  @override
  Widget build(BuildContext context) {
    Future<void> verifyLoginAndSetPage(int page) async {
      if (userManagerStore.isLoggedIn) {
        pageStore.setPage(page);
      } else {
        final result = await Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => LoginScreen()),
        );
        if (result != null && result) pageStore.setPage(page);
      }
    }

    return Column(
      children: [
        PageTile(
          label: 'Anúncios',
          iconData: Icons.list,
          onTap: () {
            pageStore.setPage(0);
          },
          highlighted: pageStore.page == 0,
        ),
        PageTile(
          label: 'Inserir Anúncio',
          iconData: Icons.edit,
          onTap: () {
            verifyLoginAndSetPage(1);
          },
          highlighted: pageStore.page == 1,
        ),
        PageTile(
          label: 'Chat',
          iconData: Icons.chat,
          onTap: () {
            verifyLoginAndSetPage(2);
          },
          highlighted: pageStore.page == 2,
        ),
        PageTile(
          label: 'Favoritos',
          iconData: Icons.favorite,
          onTap: () {
            verifyLoginAndSetPage(3);
          },
          highlighted: pageStore.page == 3,
        ),
        PageTile(
          label: 'Minha conta',
          iconData: Icons.person,
          onTap: () {
            verifyLoginAndSetPage(4);
          },
          highlighted: pageStore.page == 4,
        ),
      ],
    );
  }
}
