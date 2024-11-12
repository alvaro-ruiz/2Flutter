import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserProfile(),
    );
  }
}

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Imagen de perfil
            Container(
              padding: EdgeInsets.all(20),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://example.com/profile.jpg'),
              ),
            ),
            // Nombre y biografía
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: <Widget>[
                  Text('Usuario123', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('Aquí va la biografía del usuario', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            // Estadísticas del perfil
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('100', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Publicaciones'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('200', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Seguidores'),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('180', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('Siguiendo'),
                  ],
                ),
              ],
            ),
            // Galería de imágenes
            Container(
              padding: EdgeInsets.all(10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://example.com/image${index + 1}.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
