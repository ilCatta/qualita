import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qualita/pages/informazioni_lotto/info_lotto_adiuto_page.dart';
import 'package:qualita/pages/informazioni_lotto/info_lotto_dati_page.dart';
import 'package:qualita/pages/informazioni_lotto/info_lotto_difetti_1_page.dart';
import 'package:qualita/pages/informazioni_lotto/info_lotto_difetti_2_page.dart';

class InformazioniLottoPage extends StatefulWidget {
  const InformazioniLottoPage({super.key});

  @override
  State<InformazioniLottoPage> createState() => _InformazioniLottoPageState();
}

class _InformazioniLottoPageState extends State<InformazioniLottoPage> {
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Stack(
            children: [
              GestureDetector(
                onTap: () => context.pop(),
                child: SizedBox(
                    height: 35,
                    child: Icon(
                      EvaIcons.arrowBackOutline,
                      size: 27,
                      color: Colors.black87,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Qualità",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          shape: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() => SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: [
              _menuNav(),
              Expanded(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: [
                    InfoLottoDati(),
                    InfoLottoDifetti1(),
                    InfoLottoDifetti2(),
                    InfoLottoAdiuto(),
                  ],
                ),
              ),
              //  _pageViewWidget(),
            ],
          ),
        ),
      );

  Widget _menuNav() {
    Color textSelected = Colors.white;
    Color textUnselected = Colors.black;

    return Container(
      margin: EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 2,
          color: Color(0xFFE9531F),
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
          color: Color(0xFFE9531F),
          borderRadius: BorderRadius.circular(8),
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
            'Dati'.toUpperCase(),
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
            'Difetti 1'.toUpperCase(),
            minFontSize: 8,
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 1.3,
              fontSize: 14,
              fontWeight: menuActiveIndex.compareTo(2) == 0 ? FontWeight.w700 : FontWeight.w600,
              color: menuActiveIndex.compareTo(2) == 0 ? textSelected : textUnselected,
            ),
          ),
          3: AutoSizeText(
            'Difetti 2'.toUpperCase(),
            minFontSize: 8,
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 1.3,
              fontSize: 14,
              fontWeight: menuActiveIndex.compareTo(3) == 0 ? FontWeight.w700 : FontWeight.w600,
              color: menuActiveIndex.compareTo(3) == 0 ? textSelected : textUnselected,
            ),
          ),
          4: AutoSizeText(
            'Adiuto'.toUpperCase(),
            minFontSize: 8,
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 1.3,
              fontSize: 14,
              fontWeight: menuActiveIndex.compareTo(4) == 0 ? FontWeight.w700 : FontWeight.w600,
              color: menuActiveIndex.compareTo(4) == 0 ? textSelected : textUnselected,
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
}
