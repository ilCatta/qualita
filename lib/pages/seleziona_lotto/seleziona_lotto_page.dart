import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

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

    /* if (widget.barcodeValue == null) {
      barcodeController.text = "";
    }
    if (widget.barcodeValue != null) {
      barcodeController.text = widget.barcodeValue ?? "";
    }*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(45.0),
          child: AppBar(
            centerTitle: true,
            title: _logoWidget(),
            shape: Border(bottom: BorderSide(color: Colors.black12, width: 1)),
          ),
        ),
        body: body(),
      ),
    );
  }

  Widget _logoWidget() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/JoinLogo.png",
            height: 35,
            width: 35,
          ),
          SizedBox(width: 16),
          Center(
            child: Text(
              "Join Service",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
        ],
      );

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
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
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
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
            child: TextField(
              controller: barcodeController,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
              style: TextStyle(
                fontSize: 16,
              ),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Codice Lotto',
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                  floatingLabelStyle: TextStyle(
                    color: Color(0xFFE9531F),
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
                      size: 20,
                      color: Colors.black87,
                    ),
                  )),
            ),
          ),
        ),
      );

  Widget _buttonConferma() => Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
}
