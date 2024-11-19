import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Aplicación',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Principal(),
        '/row_images': (context) => const Imagenesfila(),
        '/column_images': (context) => const Columnaimagenes(),
        '/icon_page': (context) => const IconPage(),
        '/row_columns': (context) => const Rowcolumns(),
        '/helipuerto': (context) => const Helipuerto(),
        '/anidadas': (context) => const Anidadas(),
        '/contador': (context) => const Contador(),
        '/instagram': (context) => Instagram(),
        '/juegoicono' : (context) => const JuegoIcono(),
      },
    );
  }
}
