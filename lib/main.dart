import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicio 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 1'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
             DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Álvaro Ruiz Blánquez',
                style: GoogleFonts.aladin(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.photo),
              title: Text(
                'Fotos en Fila',
                style: GoogleFonts.aladin(
                  fontSize: 24,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const RowImagesPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_album),
              title: Text(
                'Fotos en Columna',
                style: GoogleFonts.aladin(
                  fontSize: 24,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ColumnImagesPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: Text(
                '5 Iconos',
                style: GoogleFonts.aladin(
                  fontSize: 24,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const IconPage()));
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Elige una opción',
              style: GoogleFonts.aladin(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
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
