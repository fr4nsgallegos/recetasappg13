import 'package:flutter/material.dart';
import 'package:recetasappg13/models/receta_model.dart';

class RecipePage extends StatelessWidget {
  RecetaModel recetaModel;

  RecipePage({required this.recetaModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recetaModel.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(25),
                child: Image.network(
                  recetaModel.urlImage,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 32),
              Text(recetaModel.type),
              Divider(),
              Text(recetaModel.preparation),
            ],
          ),
        ),
      ),
    );
  }
}
