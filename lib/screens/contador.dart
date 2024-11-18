import 'package:flutter/material.dart';
import '../drawer/drawer.dart';

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  ContadorState createState() => ContadorState();
}

class ContadorState extends State<Contador> {
  int _contador = 0;

  void _incrementar() {
    setState(() {
      _contador++;
    });
  }

  void _decrementar() {
    setState(() {
      _contador--;
    });
  }

  void _reiniciar() {
    setState(() {
      _contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador de Clics'),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Contador:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$_contador',
              style: const TextStyle(fontSize: 48),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _incrementar,
                  child: const Text('Incrementar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _decrementar,
                  child: const Text('Decrementar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _reiniciar,
                  child: const Text('Reiniciar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
