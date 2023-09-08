import 'package:flutter/material.dart';

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
      child: Container(
        margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white, //Color(0xFFEFF4F8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 2,
            color: Color(0xFFE9531F),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 7),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFDEEE9),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 8),
                  Center(
                    child: Text(
                      "Difetti 1",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            Divider(height: 1, color: Color(0xFFE9531F), thickness: 2),
            SizedBox(height: 8),
            _campo(label: "Id Documento", value: "12974"),
            _campo(label: "Codice Lotto", value: "220000482000294"),
            _campo(label: "Data Registrazione", value: "06/09/2023"),
            _campo(label: "Data Documento", value: "06/09/2023"),
            SizedBox(height: 16),
            Divider(
              height: 2,
              color: Colors.black12,
              indent: 16,
              endIndent: 16,
            ),
            SizedBox(height: 8),
            SizedBox(height: 16),
          ],
        ),
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
