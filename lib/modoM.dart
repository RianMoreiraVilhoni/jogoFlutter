import 'dart:math';
import 'package:flutter/material.dart';
 
void main() {
  runApp(const ContadorAppM());
}
 
class ContadorAppM extends StatelessWidget {
  const ContadorAppM({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Jogo da Adivinhação",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TelaInicial(),
    );
  }
}
 
class TelaInicial extends StatefulWidget {
  const TelaInicial({Key? key}) : super(key: key);
 
  @override
  _TelaInicialState createState() => _TelaInicialState();
}
 
class _TelaInicialState extends State<TelaInicial> {
  late int numeroAleatorio;
  late int tentativas;
  late TextEditingController controller;
  String mensagem = '';
  bool jogoEncerrado = false;
 
  @override
  void initState() {
    super.initState();
    tentativas = 5;
    iniciarJogo();
    controller = TextEditingController();
  }
 
  void iniciarJogo() {
    final random = Random();
    numeroAleatorio = random.nextInt(101);
    tentativas = 5;
    jogoEncerrado = false;
    mensagem = '';
  }
 
  void verificarNumero() {
    if (!jogoEncerrado) {
      setState(() {
        final int numeroDigitado = int.tryParse(controller.text) ?? 0;
        if (numeroDigitado == numeroAleatorio) {
          mensagem = 'Parabéns! Você acertou o número $numeroAleatorio';
          jogoEncerrado = true;
        } else {
          tentativas--;
          if (tentativas == 0) {
            mensagem = 'Não conseguiu acertar! O número era: $numeroAleatorio';
            jogoEncerrado = true;
          } else if (numeroDigitado < numeroAleatorio) {
            mensagem = 'Tente um número maior!';
          } else {
            mensagem = 'Tente um número menor!';
          }
        }
        controller.clear();
      });
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jogo da Adivinhação"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Adivnhe o número de 0 a 100",
              style: TextStyle(fontSize: 22),
            ),
            Text(
              "Tentativas restantes: $tentativas",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Container(
              width: 200,
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                verificarNumero();
              },
              child: const Text('Enviar'),
            ),
            const SizedBox(height: 20),
            Text(
              mensagem,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            iniciarJogo();
          });
        },
        tooltip: "Iniciar novo jogo",
        child: const Icon(Icons.refresh),
      ),
    );
  }
 
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}