import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:qualita/pages/informazioni_lotto/widgets/campo_info_lotto_difetti_1.dart';
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

  Widget listaBody() => Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
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
            SizedBox(height: 16),
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
            ),
            CampoInfoLottoDifetti1(
              pr: "1",
              descrizione: "SAPORI O ODORI ESTRANEI (alterazioni del prodotto non x maturazione)",
              percentuale: "0-5",
            ),
            CampoInfoLottoDifetti1(
              pr: "2",
              descrizione: "DIFETTI DI MATURAZIONE (non maturo, troppo maturo, molle, farinoso)",
              percentuale: "0-5",
            ),
            CampoInfoLottoDifetti1(
              pr: "3",
              descrizione: "DANNI DA LAVORAZIONE (tagli, amputazioni, errori nelle etichette)",
              percentuale: "0-5",
            ),
            CampoInfoLottoDifetti1(
              pr: "4",
              descrizione: "PRESENZA DI CORPI ESTRANEI (terra, sabbia, vegetali, sassi, altri corpi)",
              percentuale: "0-5",
            ),
            CampoInfoLottoDifetti1(
              pr: "5",
              descrizione: "FORMA-COLORE (macchie, annerimenti, ossidazioni, deformità, semi)",
              percentuale: "0-5",
            ),
            CampoInfoLottoDifetti1(
              pr: "6",
              descrizione: "NON INTEGRITA' (danni meccanici, lesioni, ammaccature, rotture)",
              percentuale: "0-5",
            ),
            CampoInfoLottoDifetti1(
              pr: "7",
              descrizione: "ANTIPARASSITARI EVIDENTI (presenza sul prodotto di residui visibili)",
              percentuale: "0-5",
            ),
            CampoInfoLottoDifetti1(
              pr: "8",
              descrizione: "DIFETTI DI CALIBRO (sottocalibro, scalibrato, enorme)",
              percentuale: "0-5",
            ),
            CampoInfoLottoDifetti1(
              pr: "9",
              descrizione: "PRESENZA DI MARCIUMI (lesioni, parti molli, bolle di guasto, muffe)",
              percentuale: "0-5",
            ),
            CampoInfoLottoDifetti1(
              pr: "10",
              descrizione: "UMIDITA' ANOMALA (eccesso d'acqua libera o prodotto appassito)",
              percentuale: "0-5",
            ),
            CampoInfoLottoDifetti1(
              pr: "11",
              descrizione: "PRESENZA DI PARASSITI (afidi, larve, insetti, lumache, bruchi, rosure)",
              percentuale: "0-5",
            ),
            CampoInfoLottoDifetti1(
              pr: "12",
              descrizione: "PRESENZA O TRACCE DI INFESTANTI (insetti striscianti/volanti, roditori)",
              percentuale: "0-5",
            ),
            CampoInfoLottoDifetti1(
              pr: "13",
              descrizione: "DANNI DA CONSERVAZIONE (virosi, ticchiolature, bruciature, imbrunimenti)",
              percentuale: "0-5",
            ),
          ],
        ),
      );
}
