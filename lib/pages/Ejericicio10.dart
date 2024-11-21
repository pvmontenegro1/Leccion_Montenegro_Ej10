import 'package:flutter/material.dart';

class Ejercicio10Page extends StatefulWidget {
  @override
  _Ejercicio10PageState createState() => _Ejercicio10PageState();
}

class _Ejercicio10PageState extends State<Ejercicio10Page> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  String _resultado = '';

  void _calcularVolumen() {
    double? radio = double.tryParse(_num1Controller.text);
    double? altura = double.tryParse(_num2Controller.text);

    if (radio == null || radio < 0 || altura == null || altura < 0) {
      setState(() {
        _resultado = 'Por favor, ingresa números válidos y positivos.';
      });
      return;
    }


    const double pi = 3.14;
    double volumen = pi * (radio * radio) * altura;

    setState(() {
      _resultado = 'El volumen del cilindro es: $volumen cm^3';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 10'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Radio'),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Altura'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularVolumen,
              child: Text('Calcular Volumen del Cilindro'),
            ),
            SizedBox(height: 20),
            Text(
              _resultado,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
