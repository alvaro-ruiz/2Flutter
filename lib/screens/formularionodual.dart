import 'package:flutter/material.dart';

class FormularioSwitchScreen extends StatefulWidget {
  const FormularioSwitchScreen({super.key});

  @override
  State<FormularioSwitchScreen> createState() => _FormularioSwitchScreenState();
}

class _FormularioSwitchScreenState extends State<FormularioSwitchScreen> {
  bool _isLeft = true;
  final _formKey = GlobalKey<FormState>();

  // Controladores y variables
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _correoController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();

  bool _tieneHijos = false;
  final List<TextEditingController> _edadesHijosControllers = [
  TextEditingController(text: '0'),
  TextEditingController(text: '0'),
  TextEditingController(text: '0'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario con Switch'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Información personal'),
                Switch(
                  value: !_isLeft,
                  onChanged: (value) {
                    setState(() {
                      _isLeft = !value;
                    });
                  },
                ),
                const Text('Información adicional'),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: _isLeft ? _buildFormularioIzquierda() : _buildFormularioDerecha(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _validarFormulario,
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }

  /// **Formulario de la izquierda**
  Widget _buildFormularioIzquierda() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField(
          controller: _nombreController,
          label: 'Nombre completo',
          pattern: r'^[a-zA-ZÀ-ÿ\s]+$',
          errorText: 'Solo se permiten letras y espacios',
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _correoController,
          label: 'Correo electrónico',
          pattern: r'^[\w\.-]+@[\w\.-]+\.\w+$',
          errorText: 'Ingrese un correo electrónico válido',
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _telefonoController,
          label: 'Teléfono',
          pattern: r'^\d+$',
          errorText: 'El número de teléfono debe contener solo dígitos',
        ),
        const SizedBox(height: 16),
        
        CheckboxListTile(
          title: const Text('¿Tiene hijos?'),
          value: _tieneHijos,
          onChanged: (value) {
            setState(() {
              _tieneHijos = value ?? false;
            });
          },
        ),
        if (_tieneHijos)
          ...List.generate(3, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextFormField(
                controller: _edadesHijosControllers[index],
                decoration: InputDecoration(
                  labelText: 'Edad del hijo ${index + 1}',
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (_tieneHijos && (value == null || value.isEmpty)) {
                    return 'La edad no puede estar vacía';
                  }
                  if (int.tryParse(value ?? '') == null || int.parse(value!) < 0 || int.parse(value) > 99) {
                    return 'Ingrese una edad válida (0-99)';
                  }
                  return null;
                },
              ),
            );
          }),
      ],
    );
  }

  Widget _buildFormularioDerecha() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Formulario derecho en construcción...'),
      ],
    );
  }

  /// **Widget reutilizable para los campos de texto**
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String pattern,
    required String errorText,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El campo no puede estar vacío';
        }
        if (!RegExp(pattern).hasMatch(value)) {
          return errorText;
        }
        return null;
      },
    );
  }

  /// **Valida si el formulario es válido**
  void _validarFormulario() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Formulario válido')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor corrige los errores')),
      );
    }
  }
}