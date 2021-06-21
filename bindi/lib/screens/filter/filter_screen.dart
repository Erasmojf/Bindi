import 'package:bindi/stores/filter_store.dart';
import 'package:flutter/material.dart';

import 'components/orderby_field.dart';
import 'components/price_range_field.dart';

class FilterScreen extends StatelessWidget {
  final FilterStore filter = FilterStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtrar Busca'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OrderByField(filter),
                PriceRangeField(filter),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
