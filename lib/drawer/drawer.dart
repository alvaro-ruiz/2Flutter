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
              style: GoogleFonts.aladin(fontSize: 24),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/row_images');
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_album),
            title: Text(
              'Fotos en Columna',
              style: GoogleFonts.aladin(fontSize: 24),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/column_images');
            },
          ),
          ListTile(
            leading: const Icon(Icons.star),
            title: Text(
              '5 Iconos',
              style: GoogleFonts.aladin(fontSize: 24),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/icon_page');
            },
          ),
          ListTile(
            leading: const Icon(Icons.rocket),
            title: Text(
              'Row and Columns',
              style: GoogleFonts.aladin(fontSize: 24),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/row_columns');
            },
          ),
          ListTile(
            leading: const Icon(Icons.airplanemode_active),
            title: Text(
              'Helipuerto',
              style: GoogleFonts.aladin(fontSize: 24),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/helipuerto');
            },
          ),
          ListTile(
            leading: const Icon(Icons.night_shelter),
            title: Text(
              'Filas y Columnas Anidadas',
              style: GoogleFonts.aladin(fontSize: 24),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/anidadas');
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock_clock),
            title: Text(
              'Contador',
              style: GoogleFonts.aladin(fontSize: 24),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/contador');
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: Text(
              'Instagram',
              style: GoogleFonts.aladin(fontSize: 24),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/instagram');
            },
          ),
          ListTile(
            leading: const Icon(Icons.games),
            title: Text(
              'Juego Icono',
              style: GoogleFonts.aladin(fontSize: 24),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/juegofoto');
            },
          ),
          ListTile(
            leading: const Icon(Icons.crop_portrait_rounded),
            title: Text(
              'Siete y media',
              style: GoogleFonts.aladin(fontSize: 24),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/juegosiete');
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit_document),
            title: Text(
              'Formulario',
              style: GoogleFonts.aladin(fontSize: 24),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/formulario');
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit_document),
            title: Text(
              'Adivina numero',
              style: GoogleFonts.aladin(fontSize: 24),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/anumero');
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit_document),
            title: Text(
              'Fromulario Swich',
              style: GoogleFonts.aladin(fontSize: 24),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/formnodual');
            },
          ),
        ],
      ),
    );
  }
}