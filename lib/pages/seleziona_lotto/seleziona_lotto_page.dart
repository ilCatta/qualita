// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';
import 'package:qualita/widgets/logo_widget.dart';
import 'package:qualita/widgets/menu_laterale.dart';

class SelezionaLottoPage extends StatefulWidget {
  String? barcodeValue;
  SelezionaLottoPage({this.barcodeValue});

  @override
  State<SelezionaLottoPage> createState() => _SelezionaLottoPageState();
}

class _SelezionaLottoPageState extends State<SelezionaLottoPage> {
  final barcodeController = TextEditingController();

  @override
  void initState() {
    barcodeController.text = widget.barcodeValue ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        drawer: MenuLaterale(menuSelezionato: SezioniMenu.qualita),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.0),
          child: AppBar(
            centerTitle: true,
            title: LogoWidget(
              imageSize: 35,
              textSize: 20,
            ),
            shape: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
          ),
        ),
        body: body(),
      ),
    );
  }

  Widget body() => SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              _title(),
              SizedBox(height: 20),
              _labelLotto(),
              SizedBox(height: 20),
              _buttonConferma(),
            ],
          ),
        ),
      );

  Widget _title() => Text(
        "Seleziona Lotto",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          //letterSpacing: 1,
        ),
      );

  Widget _labelLotto() => Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Card(
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
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 24),
            child: TextField(
              controller: barcodeController,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Codice Lotto',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                  floatingLabelStyle: TextStyle(
                    color: Color(0xFFE9531F),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  hintText: "...",
                  hintStyle: TextStyle(
                    fontSize: 16,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      context.go('/barcode-scanner');
                    },
                    child: Icon(
                      Ionicons.camera,
                      size: 22,
                      color: Colors.black87,
                    ),
                  )),
            ),
          ),
        ),
      );

  Widget _buttonConferma() => Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: GestureDetector(
          onTap: () => context.push("/informazioni-lotto"),
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFFE9531F),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                "Conferma",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.3,
                ),
              ),
            ),
          ),
        ),
      );
}
