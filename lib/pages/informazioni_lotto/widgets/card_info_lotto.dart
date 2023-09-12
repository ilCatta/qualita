// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:qualita/theme/custom_color.dart';

class CardInfoLotto extends StatelessWidget {
  String title;
  Widget cardBody;
  CardInfoLotto({required this.title, required this.cardBody});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2,
          color: customColor.nero,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: customColor.arancione,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: cardTitle(),
          ),
          Divider(height: 1, color: customColor.nero, thickness: 2),
          cardBody,
        ],
      ),
    );
  }

  Widget cardTitle() => Column(
        children: [
          SizedBox(height: 8),
          Center(
            child: Text(
              title.toUpperCase(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.4, color: Colors.white),
            ),
          ),
          SizedBox(height: 8),
        ],
      );
}
