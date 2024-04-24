import 'package:flutter/material.dart';
import 'modoF.dart';
import 'modoM.dart';
import 'modeH.dart';
import 'telaP.dart';

void main() {
  runApp(MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaP(),
        '/modofacil': (context) => const ContadorApp(),
        '/modomedio': (context) => const ContadorAppM(),
        '/modohard': (context) => const ContadorAppH(),
      },
    );
  }
}