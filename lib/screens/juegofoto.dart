import 'dart:async';
import 'dart:math';
import 'package:ejerciciosflutter/drawer/drawer.dart';
import 'package:flutter/material.dart';

class JuegoFoto extends StatelessWidget {
  const JuegoFoto({super.key});

  @override
  Widget build(BuildContext context) {
    return const RandomPhotoGame();
  }
}

class RandomPhotoGame extends StatefulWidget {
  const RandomPhotoGame({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RandomPhotoGameState createState() => _RandomPhotoGameState();
}

class _RandomPhotoGameState extends State<RandomPhotoGame> {
  int _score = 0;
  bool _isPhotoVisible = false;
  late double _photoX;
  late double _photoY;
  late Timer _timer;
  int _timeLeft = 5;
  bool _gameOver = false;
  late String _currentPhoto;

  final List<String> _photos = [
    'assets/images/buffon.jpg',
    'assets/images/alvaro.jpg',
    'assets/images/satan.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _startNewRound();
  }

  void _startNewRound() {
    setState(() {
      _gameOver = false;
      _isPhotoVisible = true;
      _timeLeft = 5;
      _currentPhoto = _photos[Random().nextInt(_photos.length)];
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _isPhotoVisible = false;
          _score -= 2;
          _generateRandomPosition();
          _currentPhoto = _photos[Random().nextInt(_photos.length)];
          _timeLeft = 5;
          _isPhotoVisible = true;
        }
      });
    });

    _generateRandomPosition();
  }

  void _generateRandomPosition() {
    final random = Random();
    _photoX = random.nextDouble() * 0.6;
    _photoY = random.nextDouble() * 0.5;
  }

  void _onPhotoPressed() {
    if (_isPhotoVisible) {
      setState(() {
        _score++;
        _isPhotoVisible = false;
        _timer.cancel();
        _showMilestoneSnackBar();
        _startNewRound();
      });
    }
  }

  void _showMilestoneSnackBar() {
    if (_score == 10 || _score == 25 || _score == 50) {
      final snackBar = SnackBar(
        content: Text('¡Has alcanzado $_score puntos! 🎉'),
        duration: const Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
        title: const Text('Juego de Fotos Aleatorias'),
      ),
      drawer: const MyDrawer(),
      body: Stack(
        children: [
          Container(
            color: Colors.blueGrey[50],
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Puntos: $_score',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (!_gameOver)
                        Text(
                          'Tiempo: $_timeLeft',
                          style: const TextStyle(fontSize: 25),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      if (_isPhotoVisible)
                        Positioned(
                          left: _photoX * MediaQuery.of(context).size.width,
                          top: _photoY * MediaQuery.of(context).size.height,
                          child: GestureDetector(
                            onTap: _onPhotoPressed,
                            child: AnimatedOpacity(
                              opacity: _isPhotoVisible ? 1.0 : 0.0,
                              duration: const Duration(milliseconds: 300),
                              child: Image.asset(
                                _currentPhoto, // Uso de la foto fija almacenada
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
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
