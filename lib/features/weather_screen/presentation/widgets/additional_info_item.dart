import 'package:flutter/material.dart';

class AdditionalInfoItem extends StatelessWidget {
  const AdditionalInfoItem({super.key, this.title, this.amount});

  final title;
  final amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Icon(
            Icons.cloud,
            color: Colors.blueGrey,
          ),
          SizedBox(height: 8),

          Text(
            title,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal
            ),
          ),
          SizedBox( height: 8),

          Text(
            amount.toString(),
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
}
