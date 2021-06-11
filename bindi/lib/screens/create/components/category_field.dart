import 'package:bindi/screens/category/category_screen.dart';
import 'package:bindi/stores/create_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CategoryField extends StatelessWidget {
  CategoryField(this.createStore);
  final CreateStore createStore;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListTile(
        title: createStore.category == null
            ? Text(
                'Categoria *',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
              )
            : Text(
                'Categoria *',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
        subtitle: createStore.category == null
            ? null
            : Text(
                '${createStore.category.description}',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
        trailing: Icon(Icons.keyboard_arrow_down),
        onTap: () async {
          final category = await showDialog(
            context: context,
            builder: (_) => CategoryScreen(
              showAll: false,
              selected: createStore.category,
            ),
          );
          if (category != null) {
            createStore.setCategory(category);
          }
        },
      );
    });
  }
}
