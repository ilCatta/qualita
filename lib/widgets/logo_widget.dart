// ignore_for_file: must_be_immutable

import 'package:flutter/widgets.dart';

class LogoWidget extends StatelessWidget {
  double imageSize;
  double textSize;
  LogoWidget({required this.imageSize, required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/JoinLogo.png",
          height: imageSize,
          width: imageSize,
        ),
        SizedBox(width: 16),
        Center(
          child: Text(
            "Join Service",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: textSize,
            ),
          ),
        ),
      ],
    );
  }
}
