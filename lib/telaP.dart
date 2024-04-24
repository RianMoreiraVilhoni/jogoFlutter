import 'package:flutter/material.dart';

class TelaP extends StatelessWidget {
  const TelaP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca Binaria'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Facil'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/modofacil');
              },
              child: const Text('Modo Facil'),
            ),
            const Text('Medio'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/modomedio');
              },
              child: const Text('Modo medio'),
            ),
            const Text('Dificil'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/modohard');
              },
              child: const Text('Modo hard'),
            ),
          ],
        ),
      ),
    );
  }
}