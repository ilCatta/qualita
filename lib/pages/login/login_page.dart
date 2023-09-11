import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qualita/pages/login/login_accedi.dart';
import 'package:qualita/pages/login/login_registrati.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int menuActiveIndex = 1;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void changeMenuActive(int index) {
    _pageController.animateToPage(index - 1, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
    setState(() {
      menuActiveIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: _body(),
      ),
    );
  }

  Widget _body() => SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: [
              _logoWidget(),
              _menuNav(),
              _pageView(),
            ],
          ),
        ),
      );

  Widget _logoWidget() => Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
        child: Column(
          children: [
            Image.asset(
              "assets/images/JoinLogo.png",
              height: 120,
              width: 120,
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                "Join Service",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _menuNav() {
    Color textSelected = Colors.white;
    Color textUnselected = Colors.black;
    return Container(
      margin: EdgeInsets.fromLTRB(32, 12, 32, 12),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: Colors.black,
        ),
      ),
      child: CustomSlidingSegmentedControl<int>(
        isStretch: true,
        height: 38,
        innerPadding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Color(0xFFFDEEE9),
          borderRadius: BorderRadius.circular(8),
        ),
        thumbDecoration: BoxDecoration(
          color: Color(0xFFF36F21),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.3),
              blurRadius: 4.0,
              spreadRadius: 1.0,
              offset: Offset(
                0.0,
                2.0,
              ),
            ),
          ],
        ),
        initialValue: menuActiveIndex,
        children: {
          1: AutoSizeText(
            'Accedi'.toUpperCase(),
            minFontSize: 8,
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 1.3,
              fontSize: 14,
              fontWeight: menuActiveIndex.compareTo(1) == 0 ? FontWeight.w700 : FontWeight.w600,
              color: menuActiveIndex.compareTo(1) == 0 ? textSelected : textUnselected,
            ),
          ),
          2: AutoSizeText(
            'Registrati'.toUpperCase(),
            minFontSize: 8,
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 1.3,
              fontSize: 14,
              fontWeight: menuActiveIndex.compareTo(2) == 0 ? FontWeight.w700 : FontWeight.w600,
              color: menuActiveIndex.compareTo(2) == 0 ? textSelected : textUnselected,
            ),
          ),
        },
        onValueChanged: (value) {
          changeMenuActive(value);
        },
        duration: Duration(milliseconds: 300),
        curve: Curves.linearToEaseOut,
      ),
    );
  }

  Widget _pageView() => Expanded(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            LoginAccedi(),
            LoginRegistrati(), //LoginPage(),
            //RegistrazionePage(),
          ],
        ),
      );
}
