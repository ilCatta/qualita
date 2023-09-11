import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:qualita/widgets/logo_widget.dart';

enum SezioniMenu {
  home,
  utenti,
  gruppi,
  lavorazioni,
  qualita,
  listini,
}

class MenuLaterale extends StatefulWidget {
  final SezioniMenu menuSelezionato;
  const MenuLaterale({required this.menuSelezionato});

  @override
  State<MenuLaterale> createState() => _MenuLateraleState();
}

class _MenuLateraleState extends State<MenuLaterale> {
  void navigazioneMenu(SezioniMenu nomeMenu) {
    switch (nomeMenu) {
      case SezioniMenu.home:
        Navigator.pushReplacementNamed(context, '/HomePage');
        break;
      case SezioniMenu.qualita:
        context.go("/seleziona-lotto");
        break;
      default:
        Navigator.pushReplacementNamed(context, '/HomePage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: LogoWidget(imageSize: 55, textSize: 21),
                ),
                _customDivider(),
                _drawertItem(
                  text: "Home",
                  icona: EvaIcons.home,
                  nomeMenu: SezioniMenu.home,
                ),
                _customDivider(),
                _drawertItem(
                  text: "Utenti",
                  icona: EvaIcons.person,
                  nomeMenu: SezioniMenu.utenti,
                ),
                _customDivider(),
                _drawertItem(
                  text: "Gruppi",
                  icona: EvaIcons.people,
                  nomeMenu: SezioniMenu.gruppi,
                ),
                _customDivider(),
                _drawertItem(
                  text: "Lavorazioni",
                  icona: FontAwesomeIcons.tableList,
                  nomeMenu: SezioniMenu.lavorazioni,
                ),
                _customDivider(),
                _drawertItem(
                  text: "Qualità",
                  icona: FontAwesomeIcons.appleWhole,
                  nomeMenu: SezioniMenu.qualita,
                ),
                _customDivider(),
                _drawertItem(
                  text: "Listini",
                  icona: FontAwesomeIcons.coins,
                  nomeMenu: SezioniMenu.listini,
                ),
                _customDivider(),
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget _customDivider() => Divider(
        height: 0,
        color: Colors.black12,
        indent: 8,
        endIndent: 8,
      );

  Widget _drawertItem({
    required String text,
    required IconData icona,
    required SezioniMenu nomeMenu,
  }) =>
      Container(
        decoration: widget.menuSelezionato == nomeMenu
            ? BoxDecoration(
                color: Color(0xFFE9531F),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              )
            : null,
        child: ListTile(
          onTap: () => navigazioneMenu(nomeMenu),
          splashColor: Colors.transparent,
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icona,
                color: widget.menuSelezionato == nomeMenu ? Colors.white : Colors.black87,
                size: widget.menuSelezionato == nomeMenu ? 18 : 18,
              ),
            ],
          ),
          title: Text(
            text.toUpperCase(),
            style: TextStyle(
              color: widget.menuSelezionato == nomeMenu ? Colors.white : Colors.black,
              fontSize: 15,
              fontWeight: widget.menuSelezionato == nomeMenu ? FontWeight.w700 : FontWeight.w500,
              letterSpacing: 1.5,
            ),
          ),
        ),
      );
}
