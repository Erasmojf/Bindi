import 'package:bindi/screens/filter/components/section_title.dart';
import 'package:bindi/stores/filter_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class VendorTypeField extends StatelessWidget {
  VendorTypeField(this.filter);

  final FilterStore filter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle('Tipo de anúnciante'),
        Observer(builder: (_) {
          return Wrap(
            runSpacing: 4,
            children: [
              GestureDetector(
                onTap: () {
                  if (filter.isTypeParticular) {
                    if (filter.isTypeProfissional)
                      filter.resetVendorType(VENDOR_TYPE_PARTICULAR);
                    else
                      filter.selectVendorType(VENDOR_TYPE_PROFESSIONAL);
                  } else {
                    filter.setVendorType(VENDOR_TYPE_PARTICULAR);
                  }
                },
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: filter.isTypeParticular
                        ? Colors.purple
                        : Colors.transparent,
                    border: Border.all(
                        color: filter.isTypeParticular
                            ? Colors.purple
                            : Colors.grey[400]),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Particular',
                    style: TextStyle(
                      color:
                          filter.isTypeParticular ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  if (filter.isTypeProfissional) {
                    if (filter.isTypeParticular)
                      filter.resetVendorType(VENDOR_TYPE_PROFESSIONAL);
                    else
                      filter.selectVendorType(VENDOR_TYPE_PARTICULAR);
                  } else {
                    filter.setVendorType(VENDOR_TYPE_PROFESSIONAL);
                  }
                },
                child: Container(
                  height: 50,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: filter.isTypeProfissional
                        ? Colors.purple
                        : Colors.transparent,
                    border: Border.all(
                        color: filter.isTypeProfissional
                            ? Colors.purple
                            : Colors.grey[400]),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Profissional',
                    style: TextStyle(
                      color: filter.isTypeProfissional
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
