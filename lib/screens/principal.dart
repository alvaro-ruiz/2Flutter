import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../drawer/drawer.dart';


class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 1'),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'Elige una opción',
            style: GoogleFonts.aladin(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}


// Página para mostrar imágenes en fila
class RowImagesPage extends StatelessWidget {
  const RowImagesPage({super.key});

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

// Página para mostrar imágenes en columna
class ColumnImagesPage extends StatelessWidget {
  const ColumnImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fotos en Columna'),
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

// Página para mostrar 5 iconos
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
