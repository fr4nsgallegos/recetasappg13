import 'package:flutter/material.dart';

class TextfieldPage extends StatefulWidget {
  @override
  State<TextfieldPage> createState() => _TextfieldPageState();
}

class _TextfieldPageState extends State<TextfieldPage> {
  TextEditingController _correoController = TextEditingController();

  bool _hasError = false;

  void _validarCorreo() {
    String correo = _correoController.text;
    _hasError = !correo.contains('@');
    setState(() {});
  }

  @override
  void dispose() {
    _correoController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Text Field Page"), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _correoController,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                cursorColor: Colors.red,
                // onChanged: (value) => _validarCorreo(),
                decoration: InputDecoration(
                  errorText: _hasError ? "Formato Inválido" : null,
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  labelText: "Correo",
                  hintText: "ejemplo@gmail.com",
                  helperText: "Ingresa un correo válido",
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: _hasError
                      ? Icon(Icons.cancel)
                      : Icon(Icons.check_circle),
                  suffixIconColor: _hasError ? Colors.red : Colors.green,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _validarCorreo();
                  print(_correoController.text);
                },
                child: Text("Validar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
