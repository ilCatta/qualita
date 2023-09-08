import 'package:flutter/material.dart';
import 'package:qualita/pages/informazioni_lotto/widgets/campo_info_lotto_locked.dart';
import 'package:qualita/pages/informazioni_lotto/widgets/card_info_lotto.dart';

class InfoLottoDifetti1 extends StatefulWidget {
  const InfoLottoDifetti1({super.key});

  @override
  State<InfoLottoDifetti1> createState() => _InfoLottoDifetti1State();
}

class _InfoLottoDifetti1State extends State<InfoLottoDifetti1> {
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
          title: "Difetti 1",
          cardBody: listaBody(),
        ));
  }

  Widget listaBody() => Column(
        children: [
          CampoInfoLottoLocked(label: "Id Documento", value: "12974"),
          CampoInfoLottoLocked(label: "Codice Lotto", value: "220000482000294"),
          CampoInfoLottoLocked(label: "Data Registrazione", value: "06/09/2023"),
          CampoInfoLottoLocked(label: "Data Documento", value: "06/09/2023"),
          SizedBox(height: 16),
          Divider(
            height: 2,
            color: Colors.black12,
            indent: 16,
            endIndent: 16,
          ),
        ],
      );
}
