import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CampoInfoLottoDifetti1 extends StatelessWidget {
  String pr;
  String descrizione;
  String percentuale;
  CampoInfoLottoDifetti1({required this.pr, required this.descrizione, required this.percentuale});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
        constraints: BoxConstraints(minHeight: 40, minWidth: double.infinity),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
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
              ),
            ),
            SizedBox(width: 6),
            CampoDifetti1(),
          ],
        ),
      ),
    );
  }
}

class CampoDifetti1 extends StatefulWidget {
  const CampoDifetti1({super.key});

  @override
  State<CampoDifetti1> createState() => _CampoDifetti1State();
}

class _CampoDifetti1State extends State<CampoDifetti1> {
  final List<String> items = [
    '0',
    '0-5',
    '5-10',
    '10-20',
    '20-40',
    '40-60',
    '60-100',
  ];
  String? selectedValue;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    final List<DropdownMenuItem<String>> menuItems = [];
    for (final String item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Center(
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ),
          if (item != items.last)
            DropdownMenuItem<String>(
              enabled: false,
              child: Divider(
                height: 2,
                color: Colors.black12,
              ),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<double> _getCustomItemsHeights() {
    final List<double> itemsHeights = [];
    for (int i = 0; i < (items.length * 2) - 1; i++) {
      itemsHeights.add(25);
    }
    return itemsHeights;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        items: _addDividersAfterItems(items),
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
          });
        },
        // HINT ************
        hint: Text(
          'Valore',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: Colors.black,
            fontFamily: 'OpenSans',
          ),
        ),
        // ICONA ************
        iconStyleData: IconStyleData(
          icon: Icon(
            EvaIcons.arrowDown,
          ),
          iconSize: 18,
          iconEnabledColor: Colors.grey,
          iconDisabledColor: Colors.grey,
        ),
        // STILE BOTTONE ************
        buttonStyleData: ButtonStyleData(
          height: 40,
          width: 85,
          padding: EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black26,
            ),
            color: Colors.grey.shade100,
          ),
          elevation: 0,
        ),
        // STILE DROPDOWN ************
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.grey.shade200,
          ),
          scrollbarTheme: ScrollbarThemeData(
            radius: Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        // STILE MENU ************
        menuItemStyleData: MenuItemStyleData(
          height: 40,
          customHeights: _getCustomItemsHeights(),
        ),
      ),
    );
  }
}
