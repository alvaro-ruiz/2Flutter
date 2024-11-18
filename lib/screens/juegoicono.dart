import 'dart:async';
import 'dart:math';
import 'package:ejerciciosflutter/drawer/drawer.dart';
import 'package:flutter/material.dart';

class JuegoIcono extends StatelessWidget {
  const JuegoIcono({super.key});

  @override
  Widget build(BuildContext context) {
    return const RandomIconGame();
  }
}

class RandomIconGame extends StatefulWidget {
  const RandomIconGame({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RandomIcon createState() => _RandomIcon();
}

class _RandomIcon extends State<RandomIconGame> {
  int _score = 0;
  bool _isIconVisible = false;
  late double _iconX;
  late double _iconY;
  late Timer _timer;
  int _timeLeft = 5;
  bool _gameOver = false;

  @override
  void initState() {
    super.initState();
    _startNewRound();
  }

  void _startNewRound() {
    setState(() {
      _gameOver = false;
      _isIconVisible = true;
      _timeLeft = 5; // Resetear el tiempo
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _isIconVisible = false;
          _score -= 2;
          _generateRandomPosition();
          _timeLeft = 5;
          _isIconVisible = true;
        }
      });
    });

    // Generar una nueva posición aleatoria para el ícono
    _generateRandomPosition();
  }

  void _generateRandomPosition() {
    final random = Random();
    _iconX = random.nextDouble() * 0.8; // Rango 0.0 a 0.8 (80% del ancho)
    _iconY = random.nextDouble() * 0.8; // Rango 0.0 a 0.8 (80% del alto)
  }

  void _onIconPressed() {
    if (_isIconVisible) {
      setState(() {
        _score++;
        _isIconVisible = false; // Ocultar el ícono
        _timer.cancel();
        _startNewRound(); // Comenzar una nueva ronda
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juego de Íconos Aleatorios'),
      ),
      drawer: const MyDrawer(),
      body: Stack(
        children: [
          Container(
            color: Colors.blueGrey[50],
            child: Column(
              children: [
                // Aquí se agregan los puntos y el tiempo en la parte superior, debajo del AppBar
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Puntos: $_score',
                        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      if (!_gameOver)
                        Text(
                          'Tiempo: $_timeLeft',
                          style: const TextStyle(fontSize: 25),
                        ),
                      if (_gameOver)
                        const Text(
                          '¡Se acabó el tiempo!',
                          style: TextStyle(fontSize: 25, color: Colors.red),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      // El resto de la pantalla y el ícono que aparece
                      if (_isIconVisible)
                        Positioned(
                          left: _iconX * MediaQuery.of(context).size.width,
                          top: _iconY * MediaQuery.of(context).size.height,
                          child: GestureDetector(
                            onTap: _onIconPressed,
                            child: AnimatedOpacity(
                              opacity: _isIconVisible ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 300),
                              child: const Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 60,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
