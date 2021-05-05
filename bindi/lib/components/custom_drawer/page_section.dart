import 'package:flutter/material.dart';

import 'PageTile.dart';

class PageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Anúncios',
          iconData: Icons.list,
          onTap: (){

          },
          highlighted: true,
        ),
        PageTile(
          label: 'Inserir Anúncio',
          iconData: Icons.edit,
          onTap: (){

          },
          highlighted: false,
        ),
        PageTile(
          label: 'Chat',
          iconData: Icons.chat,
          onTap: (){

          },
          highlighted: false,
        ),
        PageTile(
          label: 'Favoritos',
          iconData: Icons.favorite,
          onTap: (){

          },
          highlighted: false,
        ),
        PageTile(
          label: 'Minha conta',
          iconData: Icons.person,
          onTap: (){

          },
          highlighted: false,
        ),
      ],
    );
  }
}
