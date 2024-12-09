import 'dart:math';
import 'package:flutter/material.dart';

import '../drawer/drawer.dart';

class AdivinaNumeroScreen extends StatefulWidget {
  const AdivinaNumeroScreen({super.key});

  @override
  _AdivinaNumeroScreenState createState() => _AdivinaNumeroScreenState();
}

class _AdivinaNumeroScreenState extends State<AdivinaNumeroScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  late int _numeroObjetivo;
  String _mensaje = '';
  int _intento = 0;
  bool _isCheckboxChecked = false;

  @override
  void initState() {
    super.initState();
    _generarNumeroAleatorio();
  }

  void _generarNumeroAleatorio() {
    final random = Random();
    if (_isCheckboxChecked) {
      _numeroObjetivo = random.nextInt(1000) + 1;
    } else {
      _numeroObjetivo = random.nextInt(100) + 1;
    }
    // ignore: avoid_print
    print('Número objetivo: $_numeroObjetivo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adivina el número"),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Intenta adivinar el número ${_isCheckboxChecked ? 'entre 1 y 1000' : 'entre 1 y 100'}.",
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Número',
                  hintText: 'Introduce un número',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => _controller.clear(),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un número';
                  }
                  final number = int.tryParse(value);
                  if (number == null || number < 1 || number > (_isCheckboxChecked ? 1000 : 100)) {
                    return 'Por favor ingresa un número válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _validarNumero,
                child: const Text('Verificar'),
              ),
              const SizedBox(height: 20),
              Text(
                _mensaje,
                style: TextStyle(
                  color: _mensaje.contains("correcto") ? Colors.green : Colors.red,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              if (_intento > 0) Text('Intentos realizados: $_intento'),
              const SizedBox(height: 20),
              CheckboxListTile(
                title: const Text("Rango de 1 a 1000"),
                value: _isCheckboxChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isCheckboxChecked = value ?? false;
                    _generarNumeroAleatorio();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validarNumero() {
    if (_formKey.currentState!.validate()) {
      final numeroIngresado = int.parse(_controller.text);
      setState(() {
        _intento++;
        if (numeroIngresado < _numeroObjetivo) {
          _mensaje = 'El número es mayor, intenta de nuevo.';
        } else if (numeroIngresado > _numeroObjetivo) {
          _mensaje = 'El número es menor, intenta de nuevo.';
        } else {
          _mensaje = '¡Correcto! Has adivinado el número.';
          _mostrarDialogoGanador();
        }
      });
      _controller.clear();
    }
  }

  void _mostrarDialogoGanador() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('¡Felicidades!'),
          content: const Text('¡Has adivinado el número correctamente!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _intento = 0;
                  _mensaje = '';
                });
                _generarNumeroAleatorio();
                _controller.clear();
              },
              child: const Text('Reintentar'),
            ),
          ],
        );
      },
    );
  }
}
