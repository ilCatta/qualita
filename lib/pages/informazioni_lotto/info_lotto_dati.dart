import 'package:flutter/material.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
      ),
    );
  }

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
