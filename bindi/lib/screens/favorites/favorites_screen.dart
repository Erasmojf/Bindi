import 'package:bindi/components/custom_drawer/custom_drawer.dart';
import 'package:bindi/components/empty_card.dart';
import 'package:bindi/stores/favorite_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'components/favorite_tile.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({this.hideDrawer = false});

  final bool hideDrawer;
  final FavoriteStore favoriteStore = GetIt.I<FavoriteStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
        centerTitle: true,
      ),
      drawer: hideDrawer ? null : CustomDrawer(),
      body: Observer(
        builder: (_) {
          if (favoriteStore.favoriteList.isEmpty)
            return EmptyCard('Nenhum anúncio favoritado');

          return ListView.builder(
            padding: const EdgeInsets.all(2),
            itemCount: favoriteStore.favoriteList.length,
            itemBuilder: (_, index) =>
                FavoriteTile(favoriteStore.favoriteList[index]),
          );
        },
      ),
    );
  }
}
