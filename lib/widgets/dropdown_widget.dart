import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      // DECORACIÓN
      decoration: InputDecoration(
        // labelText: "Selecciona el tipo de plato",
        // labelStyle: TextStyle(color: Colors.white),
        hint: Text(
          "Selecciona el tipo de plato",
          style: TextStyle(color: Colors.white),
        ),
        filled: true,
        fillColor: Color(0xff0f4c5c).withOpacity(0.8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
      dropdownColor: Color(0xff0f4c5c),
      style: TextStyle(color: Colors.white),
      icon: Icon(Icons.arrow_drop_down),
      iconEnabledColor: Colors.white,
      menuMaxHeight: 150,
      items: [
        DropdownMenuItem(value: "primera", child: Text("OPción 1")),
        DropdownMenuItem(value: "Ssegunda", child: Text("OPción 2")),
        DropdownMenuItem(value: "a", child: Text("OPción 2")),
        DropdownMenuItem(value: "s", child: Text("OPción 2")),
        DropdownMenuItem(value: "d", child: Text("OPción 2")),
      ],
      onChanged: (value) {
        print(value);
      },
    );
  }
}
