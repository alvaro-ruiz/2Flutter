import 'package:flutter/material.dart';
import '../drawer/drawer.dart';

class Columnaimagenes extends StatelessWidget {
  const Columnaimagenes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fotos en Columna',
        ),
      ),
      drawer: const MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset('assets/images/buffon.jpg', width: 100, height: 100),
          Image.asset('assets/images/buffon.jpg', width: 100, height: 100),
          Image.asset('assets/images/buffon.jpg', width: 100, height: 100),
        ],
      ),
    );
  }
}
