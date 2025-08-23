import 'package:flutter/material.dart';

class TextformfieldPage extends StatelessWidget {
  TextEditingController _correoController = TextEditingController();
  TextEditingController _contrasenaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Form Field Page"), centerTitle: true),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(32),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _correoController,
                  decoration: InputDecoration(
                    hintText: "Ingresa el correo",
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor ingresa tu correo";
                    } else if (value.length < 6) {
                      return "El correo debe tener al menor 6 caracteres";
                    } else if (!RegExp(
                      "[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}",
                    ).hasMatch(value)) {
                      return "Ingrese un correo válido";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _contrasenaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Ingresa la contraseña",
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor ingresa una contraseña";
                    } else if (value.length <= 7) {
                      return "La contaseña debe tener al menor 8 caraceteres";
                    } else {
                      return null;
                    }
                  },
                ),

                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    // Validando form
                    if (_formKey.currentState!.validate()) {
                      print("Formulario validado y enviado");
                    } else {
                      print("Hay errores");
                    }
                    ;
                  },
                  child: Text("Enviar form"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
