import 'package:flutter/material.dart';

import '../drawer/drawer.dart';

class Instagram extends StatefulWidget {
  const Instagram({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InstagramState createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {
  final List<String> images1 = [
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

  final List<String> images2 = [
    'assets/images/alvaro.jpg',
    'assets/images/alvaro.jpg',
    'assets/images/alvaro.jpg',
    'assets/images/alvaro.jpg',
    'assets/images/alvaro.jpg',
    'assets/images/alvaro.jpg',
    'assets/images/alvaro.jpg',
    'assets/images/alvaro.jpg',
    'assets/images/alvaro.jpg',
  ];

  final List<String> texts = [
    'Nuevo',
    'Libros',
    'Viajes',
    'Amigos',
    'Familia',
    'Coche',
  ];

  List<String> currentImages = [];

  @override
  void initState() {
    super.initState();
    currentImages = images1;
  }

  void _showFeatureUnavailableDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Funcionalidad no disponible'),
          content: const Text('Esta funcionalidad estará disponible en futuras actualizaciones.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

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
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: texts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: index == 0
                              ? const Icon(Icons.add,
                                  size: 30, color: Colors.black)
                              : ClipOval(
                                  child: Image.asset(
                                    'assets/images/buffon.jpg',
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          texts[index],
                          style: const TextStyle(fontSize: 12),
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
                  onPressed: () {
                    setState(() {
                      currentImages = images1;
                    });
                  },
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
                  onPressed: () {
                    setState(() {
                      currentImages = images2;
                    });
                  },
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
              itemCount: currentImages.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(2),
                child: Image.asset(currentImages[index], fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.home, size: 30),
                  onPressed: _showFeatureUnavailableDialog,
                ),
                IconButton(
                  icon: const Icon(Icons.search, size: 30),
                  onPressed: _showFeatureUnavailableDialog,
                ),
                IconButton(
                  icon: const Icon(Icons.add_box_outlined, size: 30),
                  onPressed: _showFeatureUnavailableDialog,
                ),
                IconButton(
                  icon: const Icon(Icons.favorite, size: 30),
                  onPressed: _showFeatureUnavailableDialog,
                ),
                IconButton(
                  icon: const Icon(Icons.account_circle, size: 30),
                  onPressed: _showFeatureUnavailableDialog,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
