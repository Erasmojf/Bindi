import 'package:bindi/models/ad.dart';
import 'package:flutter/material.dart';

class LocationPanel extends StatelessWidget {
  LocationPanel(this.ad);
  final Ad ad;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 10),
          child: Text(
            'Localização',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text('CEP'),
                  SizedBox(height: 12),
                  Text('Município'),
                  SizedBox(height: 12),
                  Text('Bairro'),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text('${ad.address.cep}'),
                    const SizedBox(height: 12),
                    Text('${ad.address.city.name}'),
                    const SizedBox(height: 12),
                    Text('${ad.address.district}'),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
