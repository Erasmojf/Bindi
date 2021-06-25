import 'package:bindi/models/ad.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DescriptionPanel extends StatelessWidget {
  DescriptionPanel(this.ad);
  final Ad ad;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Text(
            'Descrição',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: ReadMoreText(
            ad.description,
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Ver mais',
            trimExpandedText: '...menos',
            colorClickableText: Colors.purple,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.grey[700],
            ),
          ),
        ),
      ],
    );
  }
}
