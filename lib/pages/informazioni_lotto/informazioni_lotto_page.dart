import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InformazioniLottoPage extends StatefulWidget {
  const InformazioniLottoPage({super.key});

  @override
  State<InformazioniLottoPage> createState() => _InformazioniLottoPageState();
}

class _InformazioniLottoPageState extends State<InformazioniLottoPage> {
  int menuActiveIndex = 1;

  void changeMenuActive(int index) {
    setState(() {
      menuActiveIndex = index;
    });
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
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: _menuNav(),
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
          width: 1.5,
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
            style: TextStyle(
              letterSpacing: 1.3,
              fontSize: 14,
              fontWeight: menuActiveIndex.compareTo(1) == 0 ? FontWeight.w700 : FontWeight.w600,
              color: menuActiveIndex.compareTo(1) == 0 ? textSelected : textUnselected,
            ),
          ),
          2: AutoSizeText(
            'Difetti'.toUpperCase(),
            style: TextStyle(
              letterSpacing: 1.3,
              fontSize: 14,
              fontWeight: menuActiveIndex.compareTo(2) == 0 ? FontWeight.w700 : FontWeight.w600,
              color: menuActiveIndex.compareTo(2) == 0 ? textSelected : textUnselected,
            ),
          ),
          3: AutoSizeText(
            'Adiuto'.toUpperCase(),
            style: TextStyle(
              letterSpacing: 1.3,
              fontSize: 14,
              fontWeight: menuActiveIndex.compareTo(3) == 0 ? FontWeight.w700 : FontWeight.w600,
              color: menuActiveIndex.compareTo(3) == 0 ? textSelected : textUnselected,
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

  Widget _paginaUno() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text(
              "Dati Entrata",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          _campo(label: "Num. Doc. Gamma", value: "1310"),
          _campo(label: "Codice Lotto", value: "220000482000294"),
          _campo(label: "Data Registrazione", value: "13/05/2022"),
          _campo(label: "Data Documento", value: "11/05/2022"),
          _campo(label: "Fornitore", value: "482 | ROCCA di CAPRILEONE IMPRESA AGRICOLA COOP. PER AZIONI"),
          _campo(label: "Articolo", value: "ARANCE VALENCIA IT Cal. 4 Cat. II BIO"),
          _campo(label: "Imballo", value: "E04 | Cartone | 0,65kg"),
          _campo(label: "Note", value: "Marcio Macchiato 20/30%"),
          _campo(label: "Num. Doc. Forn.", value: "220"),
          _campo(label: "Prog. Riga", value: "1"),
          _campo(label: "Colli Riga", value: "55"),
          _campo(label: "Media Collo", value: "16"),
        ],
      );

  Widget _campo({required String label, required String value}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
        constraints: BoxConstraints(minHeight: 55, minWidth: double.infinity),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(
            color: Colors.grey.shade600,
          ),
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
                color: Colors.grey.shade800,
              ),
            ),
            SizedBox(height: 2),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
