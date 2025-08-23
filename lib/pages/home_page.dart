import 'package:flutter/material.dart';
import 'package:recetasappg13/widgets/form_item_widget.dart';

class HomePage extends StatelessWidget {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _preparationController = TextEditingController();
  TextEditingController _imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormItemWidget(
                controller: _titleController,
                hint: "Ingresa el título",
                iconData: Icons.title,
              ),
              FormItemWidget(
                controller: _preparationController,
                hint: "Ingrsa la receta",
                iconData: Icons.list,
                maxLines: 3,
              ),
              FormItemWidget(
                controller: _imageController,
                hint: "Ingresa el url de la imagen",
                iconData: Icons.image,
              ),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                },
                child: Text("DEGUG"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
