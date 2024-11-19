import 'package:flutter/material.dart';

import '../drawer/drawer.dart';

class Imagenesfila extends StatefulWidget {
  const Imagenesfila({super.key});

  @override
  State<Imagenesfila> createState() => _ImagenesfilaState();
}

class _ImagenesfilaState extends State<Imagenesfila> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fotos en Fila'),
      ),
      drawer: const MyDrawer(),
      body: Row(
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