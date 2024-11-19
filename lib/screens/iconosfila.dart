import 'package:flutter/material.dart';

import '../drawer/drawer.dart';

class IconPage extends StatelessWidget {
  const IconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5 Iconos'),
      ),
      drawer: const MyDrawer(),
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(Icons.home, size: 50),
          Icon(Icons.star, size: 50),
          Icon(Icons.settings, size: 50),
          Icon(Icons.phone, size: 50),
          Icon(Icons.camera, size: 50),
        ],
      ),
    );
  }
}