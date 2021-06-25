import 'package:bindi/models/ad.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ActiveTile extends StatelessWidget {
  ActiveTile(this.ad);

  final Ad ad;

  final List<MenuChoice> choices = [
    MenuChoice(index: 0, title: 'Editar', iconData: Icons.edit),
    MenuChoice(index: 1, title: 'Já vendi', iconData: Icons.thumb_up),
    MenuChoice(index: 2, title: 'Excluid', iconData: Icons.delete),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: Container(
        height: 80,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: CachedNetworkImage(
                imageUrl: ad.images.isEmpty
                    ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/Empty_set.svg/1200px-Empty_set.svg.png'
                    : ad.images.first,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ad.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'R\$ ${ad.price}',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      '${ad.views} Visitas',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[800],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                PopupMenuButton<MenuChoice>(
                  onSelected: (choice) {
                    switch (choice.index) {
                      case 0:
                        break;
                      case 1:
                        break;
                      case 2:
                        break;
                    }
                  },
                  icon: Icon(Icons.more_vert, size: 20),
                  itemBuilder: (_) {
                    return choices
                        .map(
                          (choice) => PopupMenuItem<MenuChoice>(
                            value: choice,
                            child: Row(
                              children: [
                                Icon(
                                  choice.iconData,
                                  size: 20,
                                  color: Colors.purple,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  choice.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.purple,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MenuChoice {
  MenuChoice({this.index, this.title, this.iconData});

  final int index;
  final String title;
  final IconData iconData;
}
