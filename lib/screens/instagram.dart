import 'package:flutter/material.dart';

import '../drawer/drawer.dart';

class Instagram extends StatelessWidget {
  
  final List<String> images = [
    'assets/images/buffon.jpg',
    'assets/images/buffon.jpg',
    'assets/images/buffon.jpg',
    'assets/images/buffon.jpg',
    'assets/images/buffon.jpg',
    'assets/images/buffon.jpg',
    'assets/images/buffon.jpg',
    'assets/images/buffon.jpg',
    'assets/images/buffon.jpg',
  ];

  final List<String> imageUrls = [
    'assets/images/buffon.jpg',
    'assets/images/alvaro.jpg',
    'assets/images/buffon.jpg',
    'assets/images/alvaro.jpg',
    'assets/images/buffon.jpg',
    'assets/images/alvaro.jpg',
  ];

  final List<String> texts = [
    'Nuevo',
    'Libros',
    'Viajes',
    'Amigos',
    'Famila',
    'Coche',
  ];

  Instagram({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aalvarezdelvayo'),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/alvaro.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text('Nombre de Usuario',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('"Nunca sabes lo que te depara el futuro"'),
                  Text('faqsandroid.com/',
                      style: TextStyle(color: Colors.blue)),
                ],
              ),
              Column(
                children: [
                  Text('12', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Posts'),
                ],
              ),
              Column(
                children: [
                  Text('300', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Followers'),
                ],
              ),
              Column(
                children: [
                  Text('180', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Following'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.grey),
                minimumSize: const Size(double.infinity, 40),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: const Text('Editar perfil',
                  style: TextStyle(color: Colors.black)),
            ),
          ),
          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height:
                  100, // Ajusta la altura para que se acomode el círculo y el texto
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6, // Número de círculos
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0), // Espaciado entre círculos
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Centra los elementos dentro de la columna
                      children: [
                        CircleAvatar(
                          radius: 25, // Ajusta el tamaño de los círculos aquí
                          backgroundColor:
                              Colors.white, // Color de fondo del círculo
                          child: index == 0
                              ? const Icon(Icons.add,
                                  size: 30, color: Colors.black)
                              : ClipOval(
                                  // Muestra imagen en los círculos
                                  child: Image.asset(
                                    imageUrls[
                                        index], // Asignamos la URL de la imagen correspondiente
                                    width: 50, // Tamaño de la imagen
                                    height: 50,
                                    fit: BoxFit
                                        .cover, // Ajusta la imagen al círculo
                                  ),
                                ),
                        ),
                        const SizedBox(
                            height: 8), // Espacio entre el círculo y el texto
                        Text(
                          texts[
                              index], // Asignamos el texto correspondiente a cada círculo
                          style: const TextStyle(
                              fontSize: 12), // Tamaño y estilo del texto
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    minimumSize: const Size(double.infinity, 40),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Icon(Icons.grid_on, color: Colors.black),
                ),
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    minimumSize: const Size(double.infinity, 40),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Icon(Icons.person_pin_outlined,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: images.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(2),
                child: Image.asset(images[index],
                    fit: BoxFit.cover),
              ),
            ),
          ),

          // Iconos debajo del grid
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.home, size: 30),
                Icon(Icons.search, size: 30),
                Icon(Icons.add_box_outlined, size: 30),
                Icon(Icons.favorite, size: 30),
                Icon(Icons.account_circle, size: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
