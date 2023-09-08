// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CardInfoLotto extends StatelessWidget {
  String title;
  Widget body;
  CardInfoLotto({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white, //Color(0xFFEFF4F8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 2,
          color: Color(0xFFE9531F),
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
              color: Color(0xFFFDEEE9),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            ),
            child: Column(
              children: [
                SizedBox(height: 8),
                Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          Divider(height: 1, color: Color(0xFFE9531F), thickness: 2),
          SizedBox(height: 8),
          body,
        ],
      ),
    );
  }
}
