import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';

class LoginRegistrati extends StatefulWidget {
  const LoginRegistrati({super.key});

  @override
  State<LoginRegistrati> createState() => _LoginRegistratiState();
}

class _LoginRegistratiState extends State<LoginRegistrati> {
  bool _oscuraPassword = true;
  bool _oscuraConfermaPassword = true;

  final _focusNodeNome = FocusNode();
  final _focusNodeCognome = FocusNode();
  final _focusNodeEmail = FocusNode();
  final _focusNodePassword = FocusNode();
  final _focusNodeConfermaPassword = FocusNode();

  @override
  void dispose() {
    _focusNodeNome.dispose();
    _focusNodeCognome.dispose();
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _focusNodeConfermaPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _formWidget(),
              _bottoneRegistrati(),
            ],
          ),
        ],
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
            padding: EdgeInsets.only(top: 3.0, bottom: 12.0),
            width: 300,
            //height: 150,
            child: Column(
              children: [
                _nomeField(),
                Divider(height: 0, color: Colors.black12),
                _cognomeField(),
                Divider(height: 0, color: Colors.black12),
                _emailField(),
                Divider(height: 0, color: Colors.black12),
                _passwordField(),
                Divider(height: 0, color: Colors.black12),
                _confermaPasswordField(),
              ],
            ),
          ),
        ),
      );

  Widget _nomeField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 24),
        child: TextField(
          focusNode: _focusNodeNome,
          onSubmitted: (_) {
            _focusNodeCognome.requestFocus();
          },
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Nome",
              hintStyle: TextStyle(fontSize: 16, color: Colors.black38),
              icon: Icon(
                FontAwesomeIcons.user,
                color: Colors.black87,
                size: 22,
              )),
        ),
      );

  Widget _cognomeField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 24),
        child: TextField(
          focusNode: _focusNodeCognome,
          onSubmitted: (_) {
            _focusNodeEmail.requestFocus();
          },
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.words,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Cognome",
              hintStyle: TextStyle(fontSize: 16, color: Colors.black38),
              icon: Icon(
                FontAwesomeIcons.user,
                color: Colors.black87,
                size: 22,
              )),
        ),
      );

  Widget _emailField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 24),
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
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 24),
        child: TextField(
          focusNode: _focusNodePassword,
          onSubmitted: (_) {
            _focusNodeConfermaPassword.requestFocus();
          },
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

  Widget _confermaPasswordField() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 24),
        child: TextField(
          focusNode: _focusNodeConfermaPassword,
          onSubmitted: (_) {
            // TODO: Login;
          },
          textInputAction: TextInputAction.go,
          obscureText: _oscuraConfermaPassword,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Conferma Password",
              hintStyle: TextStyle(fontSize: 16, color: Colors.black38),
              icon: Icon(
                Ionicons.lock_closed,
                color: Colors.black87,
                size: 24,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _oscuraConfermaPassword = !_oscuraConfermaPassword;
                  });
                },
                child: Icon(
                  _oscuraConfermaPassword ? Ionicons.eye_outline : Ionicons.eye_off_outline,
                  size: 20,
                  color: Colors.black87,
                ),
              )),
        ),
      );

  Widget _bottoneRegistrati() => ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFF36F21),
          splashFactory: NoSplash.splashFactory,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
          child: Text(
            "REGISTRATI",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      );
}
