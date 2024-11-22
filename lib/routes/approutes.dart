import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRoutes {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => const Principal(),
    '/row_images': (context) => const Imagenesfila(),
    '/column_images': (context) => const Columnaimagenes(),
    '/icon_page': (context) => const IconPage(),
    '/row_columns': (context) => const Rowcolumns(),
    '/helipuerto': (context) => const Helipuerto(),
    '/anidadas': (context) => const Anidadas(),
    '/contador': (context) => const Contador(),
    '/instagram': (context) => const Instagram(),
    '/juegofoto': (context) => const JuegoFoto(),
  };
}
