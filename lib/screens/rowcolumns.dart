import 'package:flutter/material.dart';

import '../drawer/drawer.dart';

class Rowcolumns extends StatelessWidget {
  const Rowcolumns({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Center(
          child: Text('Ejemplo de filas y columnas anidadas'),
        ),
      ),
       drawer: const MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/buffon.jpg', width: 100, height: 100),
                  const Text('Llamar por teléfono'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/buffon.jpg', width: 100, height: 100),
                  const Text('Enviar mensaje'),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/buffon.jpg', width: 100, height: 100),
                  const Text('Instagram'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/buffon.jpg', width: 100, height: 100),
                  const Text('Whatsapp'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}