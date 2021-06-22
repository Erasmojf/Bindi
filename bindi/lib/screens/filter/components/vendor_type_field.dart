import 'package:bindi/screens/filter/components/section_title.dart';
import 'package:bindi/stores/filter_store.dart';
import 'package:flutter/material.dart';

class VendorTypeField extends StatelessWidget {
  VendorTypeField(this.filter);

  final FilterStore filter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle('Tipo de anúnciante'),
      ],
    );
  }
}
