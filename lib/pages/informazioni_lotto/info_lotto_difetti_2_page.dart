import 'package:flutter/material.dart';
import 'package:qualita/pages/informazioni_lotto/widgets/campo_info_lotto_locked.dart';
import 'package:qualita/pages/informazioni_lotto/widgets/card_info_lotto.dart';

class InfoLottoDifetti2 extends StatefulWidget {
  const InfoLottoDifetti2({super.key});

  @override
  State<InfoLottoDifetti2> createState() => _InfoLottoDifetti2State();
}

class _InfoLottoDifetti2State extends State<InfoLottoDifetti2> {
  final _scrollController = ScrollController();
  ScrollPhysics _physics = ClampingScrollPhysics();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels <= 56) {
        setState(() => _physics = ClampingScrollPhysics());
      } else {
        setState(() => _physics = BouncingScrollPhysics());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: _scrollController,
        physics: _physics,
        child: CardInfoLotto(
          title: "Difetti 2",
          cardBody: listaBody(),
        ));
  }

  Widget listaBody() => Column(
        children: [
          CampoInfoLottoLocked(label: "Id Documento", value: "12951"),
          CampoInfoLottoLocked(label: "Codice Lotto", value: "220000482000294"),
          CampoInfoLottoLocked(label: "Data Registrazione", value: "13/07/2023"),
          CampoInfoLottoLocked(label: "Data Documento", value: "13/07/2023"),
          SizedBox(height: 16),
          Divider(
            height: 2,
            color: Colors.black12,
            indent: 16,
            endIndent: 16,
          ),
          SizedBox(height: 16),
          /*
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: AutoSizeText(
              "Descrizione e percentuale del difetto".toUpperCase(),
              minFontSize: 8,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),*/
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Descrizione",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Percentuale",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                difettoDescrizione(),
                campoDaCompilare(),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                difettoDescrizione(),
                campoDaCompilare(),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                difettoDescrizione(),
                campoDaCompilare(),
              ],
            ),
          ),
        ],
      );

  Widget difettoDescrizione() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pr. 1",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade800,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Calibro Piccolo",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );

  Widget campoDaCompilare() => Card(
        elevation: 0,
        surfaceTintColor: Color(0xffffffff),
        color: Color(0xffffffff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: Colors.black12,
            width: 1.3,
          ),
        ),
        child: SizedBox(
          width: 85,
          height: 40,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            child: TextField(
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      );
}
