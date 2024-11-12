import 'package:flutter/material.dart';

import '../drawer/drawer.dart';

class Helipuerto extends StatelessWidget {
  const Helipuerto({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ejemplo de Container Circular'),
        ),
        drawer: const MyDrawer(),
        body: Center(
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.orange,
                  width: 10,
                ),
              ),
              width: 280,
              height: 280,
              alignment: Alignment.center,
              child: const Text(
                'H',
                style: TextStyle(
                  fontSize: 180,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}