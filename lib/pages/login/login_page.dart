import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            context.go("/seleziona-lotto");
            /* String barcodeValue = "d";
            context.goNamed(
              '/seleziona-lotto',
              pathParameters: {
                'barcodeValue': barcodeValue,
              },
            );
            */
          },
          child: Text("TextButton"),
        ),
      ),
    );
  }
}
