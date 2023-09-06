import 'package:go_router/go_router.dart';
import 'package:qualita/pages/seleziona_lotto_page.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SelezionaLottoPage(),
    ),
  ],
);
