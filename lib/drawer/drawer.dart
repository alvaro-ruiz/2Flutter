import 'package:ejerciciosflutter/screens/principal.dart';
import 'package:ejerciciosflutter/screens/rowcolumns.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Álvaro Ruiz Blánquez',
                  style: GoogleFonts.aladin(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'https://github.com/alvaro-ruiz/2Flutter.git',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RowImagesPage()));
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ColumnImagesPage()));
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
             ListTile(
              leading: const Icon(Icons.rocket),
              title: Text(
                'Row and Columns',
                style: GoogleFonts.aladin(
                  fontSize: 24,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Rowcolumns()));
              },
            ),
           /* ListTile(
              leading: const Icon(Icons.rocket),
              title: Text(
                'Reto 1',
                style: GoogleFonts.aladin(
                  fontSize: 24,
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const RetoUno()));
              },
            ),*/
        ],
      ),
    );
  }
}