import 'package:flutter/material.dart';
import 'package:qualita/pages/informazioni_lotto/widgets/campo_info_lotto_locked.dart';
import 'package:qualita/pages/informazioni_lotto/widgets/card_info_lotto.dart';

class InfoLottoDati extends StatefulWidget {
  const InfoLottoDati({super.key});

  @override
  State<InfoLottoDati> createState() => _InfoLottoDatiState();
}

class _InfoLottoDatiState extends State<InfoLottoDati> {
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
          title: "Dati Entrata",
          cardBody: listaBody(),
        ));
  }

  Widget listaBody() => Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          children: [
            CampoInfoLottoLocked(label: "Num. Doc. Gamma", value: "1310"),
            CampoInfoLottoLocked(label: "Codice Lotto", value: "220000482000294"),
            CampoInfoLottoLocked(label: "Data Registrazione", value: "13/05/2022"),
            CampoInfoLottoLocked(label: "Data Documento", value: "11/05/2022"),
            CampoInfoLottoLocked(label: "Fornitore", value: "482 | ROCCA di CAPRILEONE IMPRESA AGRICOLA COOP. PER AZIONI"),
            CampoInfoLottoLocked(label: "Articolo", value: "ARANCE VALENCIA IT Cal. 4 Cat. II BIO"),
            CampoInfoLottoLocked(label: "Imballo", value: "E04 | Cartone | 0,65kg"),
            CampoInfoLottoLocked(label: "Note", value: "Marcio Macchiato 20/30%"),
            CampoInfoLottoLocked(label: "Num. Doc. Forn.", value: "220"),
            CampoInfoLottoLocked(label: "Prog. Riga", value: "1"),
            CampoInfoLottoLocked(label: "Colli Riga", value: "55"),
            CampoInfoLottoLocked(label: "Media Collo", value: "16"),
          ],
        ),
      );
}
