import 'package:flutter/material.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  final String email;
  final String name;
  HomePage({required this.email, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Bienvenido, $name'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('¡Hola, $name!', style: TextStyle(color: Colors.green, fontSize: 24)),
      ),
    );
  }
}
