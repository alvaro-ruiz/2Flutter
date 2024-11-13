import 'package:flutter/material.dart';

import '../drawer/drawer.dart';

class anidadas extends StatelessWidget {
  const anidadas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Filas y columnas anidadas'),
        ),
        drawer: const MyDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Primera fila
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.network(
                      'assets/images/bruneto.jpg',
                      width: 150,
                      height: 150,
                    ),
                    const Text('"Dante y Virgilio con Brunetto" \n Gustave Doré'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Segunda fila
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.network(
                      'assets/images/buffon.jpg',
                      width: 150,
                      height: 150,
                    ),
                    const Text('"El bufón Stańczyk" \n Jan Matejko'),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    Image.network(
                      'assets/images/expulsion.jpg',
                      width: 150,
                      height: 150,
                    ),
                    const Text('"Expulsión de Adam y Eva del Eden" \n Gustave Doré'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Tercera fila
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.network(
                      'assets/images/jerusalem.jpg',
                      width: 150,
                      height: 150,
                    ),
                    const Text('"El camino a Jerusalén" \n Gustave Doré'),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    Image.network(
                      'assets/images/satan.jpg',
                      width: 150,
                      height: 150,
                    ),
                    const Text('"Paraiso Perdido" \n Gustave Doré'),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    Image.network(
                      'assets/images/torre.jpg',
                      width: 150,
                      height: 150,
                    ),
                    const Text('"Torre de Bavel" \n Gustave Doré'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
