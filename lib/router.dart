import 'package:go_router/go_router.dart';
import 'package:qualita/pages/login/login_page.dart';
import 'package:qualita/pages/seleziona_lotto/seleziona_lotto_page.dart';
import 'package:qualita/pages/seleziona_lotto/widget/barcode_scanner_window.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/seleziona-lotto',
      builder: (context, state) => SelezionaLottoPage(),
    ),
    GoRoute(
      path: '/seleziona-lotto/:barcodeValue',
      name: '/seleziona-lotto',
      builder: (context, state) => SelezionaLottoPage(
        barcodeValue: state.pathParameters['barcodeValue'],
      ),
    ),
    GoRoute(
      path: '/barcode-scanner',
      name: '/barcode-scanner',
      builder: (context, state) => BarcodeScannerWithScanWindow(),
    ),
  ],
);
