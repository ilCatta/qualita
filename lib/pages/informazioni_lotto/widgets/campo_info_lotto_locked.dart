// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:qualita/theme/custom_color.dart';

class CampoInfoLottoLocked extends StatelessWidget {
  String label;
  String value;
  CampoInfoLottoLocked({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
      child: Container(
        padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
        constraints: BoxConstraints(minHeight: 55, minWidth: double.infinity),
        width: double.infinity,
        decoration: BoxDecoration(
          color: customColor.lockedBg,
          border: Border.all(color: customColor.lockedBorder, width: 1.3),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: customColor.lockedLabel,
              ),
            ),
            SizedBox(height: 2),
            Text(
              value,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: customColor.lockedText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
