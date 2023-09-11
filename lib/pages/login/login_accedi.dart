import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class LoginAccedi extends StatefulWidget {
  const LoginAccedi({super.key});

  @override
  State<LoginAccedi> createState() => _LoginAccediState();
}

class _LoginAccediState extends State<LoginAccedi> {
  bool _oscuraPassword = true;
  final _focusNodeEmail = FocusNode();
  final _focusNodePassword = FocusNode();

  @override
  void dispose() {
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.0),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                _formWidget(),
                _bottoneAccedi(),
              ],
            ),
            _bottonePasswordDimenticata(),
          ],
        ),
      ),
    );
  }

  Widget _formWidget() => Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Card(
          elevation: 2,
          color: Colors.grey.shade100,
          surfaceTintColor: Colors.grey.shade100,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
            width: 300,
            child: Column(
              children: [
                _emailField(),
                Divider(height: 0, color: Colors.black12),
                _passwordField(),
              ],
            ),
          ),
        ),
      );

  Widget _emailField() => Padding(
        padding: const EdgeInsets.only(bottom: 2, left: 24, right: 24),
        child: TextField(
          focusNode: _focusNodeEmail,
          onSubmitted: (_) {
            _focusNodePassword.requestFocus();
          },
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Email",
              hintStyle: TextStyle(fontSize: 16, color: Colors.black38),
              icon: Icon(
                FontAwesomeIcons.envelope,
                color: Colors.black87,
                size: 22,
              )),
        ),
      );

  Widget _passwordField() => Padding(
        padding: const EdgeInsets.only(top: 2, left: 24, right: 24),
        child: TextField(
          focusNode: _focusNodePassword,
          onSubmitted: (_) {
            // TODO: Login;
          },
          textInputAction: TextInputAction.go,
          obscureText: _oscuraPassword,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Password",
              hintStyle: TextStyle(fontSize: 16, color: Colors.black38),
              icon: Icon(
                Ionicons.lock_closed,
                color: Colors.black87,
                size: 24,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _oscuraPassword = !_oscuraPassword;
                  });
                },
                child: Icon(
                  _oscuraPassword ? Ionicons.eye_outline : Ionicons.eye_off_outline,
                  size: 20,
                  color: Colors.black87,
                ),
              )),
        ),
      );

  Widget _bottoneAccedi() => ElevatedButton(
        onPressed: () {
          context.go("/seleziona-lotto");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFF36F21),
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 48),
          child: Text(
            "ACCEDI",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );

  Widget _bottonePasswordDimenticata() => Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: TextButton(
          onPressed: () {},
          child: Text(
            "Password dimenticata?",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
}
