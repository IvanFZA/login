import 'package:flutter/material.dart';
import '../db/database_helper.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final DatabaseHelper dbHelper = DatabaseHelper();

  void _register(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await dbHelper.registerUser(_nameController.text, _emailController.text, _passwordController.text);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text('Registro'), backgroundColor: Colors.green),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre de usuario',
                    prefixIcon: Icon(Icons.person, color: Colors.green),
                  ),
                  validator: (value) => value!.isEmpty ? 'El nombre es obligatorio' : null,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Correo',
                    prefixIcon: Icon(Icons.email, color: Colors.green),
                  ),
                  validator: (value) => value!.isEmpty ? 'El correo es obligatorio' : null,
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    prefixIcon: Icon(Icons.lock, color: Colors.green),
                  ),
                  validator: (value) => value!.length < 6 ? 'Mínimo 6 caracteres' : null,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () => _register(context),
                  child: Text('Registrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
