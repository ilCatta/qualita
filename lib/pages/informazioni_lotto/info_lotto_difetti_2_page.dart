import 'package:flutter/material.dart';
import 'package:qualita/pages/informazioni_lotto/widgets/campo_info_lotto_locked.dart';
import 'package:qualita/pages/informazioni_lotto/widgets/card_info_lotto.dart';
import 'package:qualita/theme/custom_color.dart';

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

  Widget listaBody() => Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            CampoInfoLottoLocked(label: "Id Documento", value: "12951"),
            CampoInfoLottoLocked(label: "Codice Lotto", value: "220000482000294"),
            CampoInfoLottoLocked(label: "Data Registrazione", value: "13/07/2023"),
            CampoInfoLottoLocked(label: "Data Documento", value: "13/07/2023"),
            SizedBox(height: 16),
            Divider(
              height: 2,
              color: Colors.black12,
              indent: 0,
              endIndent: 0,
            ),
            SizedBox(height: 16),
            _intestazioneTabella(),
            SizedBox(height: 16),
            _rowDifetto(pr: 1, descrizione: "Calibro Piccolo", value: 30),
            SizedBox(height: 8),
            _rowDifetto(pr: 2, descrizione: "Calibro Medio", value: 27),
            SizedBox(height: 8),
            _rowDifetto(pr: 3, descrizione: "Calibro Grande", value: 41),
            SizedBox(height: 8),
            _rowDifettoTotale(value: 100),
          ],
        ),
      );

  Widget _intestazioneTabella() => Row(
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
      );

  Widget _rowDifetto({required int pr, required String descrizione, required double value}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _difettoDescrizione(pr: pr, descrizione: descrizione),
          _difettoValore(value: value),
        ],
      );

  Widget _difettoDescrizione({required int pr, required String descrizione}) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pr. $pr",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade800,
            ),
          ),
          SizedBox(height: 4),
          Text(
            descrizione,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );

  Widget _difettoValore({required double value}) => Card(
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
        child: Container(
          padding: EdgeInsets.fromLTRB(12, 6, 12, 5),
          width: 85,
          height: 40,
          child: TextFormField(
            initialValue: value.toStringAsFixed(0),
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              //contentPadding: EdgeInsets.all(0),
              border: InputBorder.none,
            ),
          ),
        ),
      );

  Widget _rowDifettoTotale({required double value}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Totale",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Card(
            elevation: 0,
            surfaceTintColor: Color(0xffffffff),
            color: customColor.lockedBg,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: customColor.lockedBorder,
                width: 1.3,
              ),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
              width: 85,
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value.toStringAsFixed(0),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
