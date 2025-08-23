import 'package:flutter/material.dart';
import 'package:recetasappg13/models/receta_model.dart';
import 'package:recetasappg13/widgets/form_item_widget.dart';
import 'package:recetasappg13/widgets/receta_card_widget.dart';

class HomePage extends StatelessWidget {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _preparationController = TextEditingController();
  TextEditingController _imageController = TextEditingController();

  RecetaModel receta1 = RecetaModel(
    title: "Wafles",
    preparation:
        '''Primero agregamos la leche, huevos, azúcar, sal y esencia de vainilla en nuestra licuadora y mezclamos bien durante 2 minutos.
        Luego con un colador tamizamos la harina y el polvo de hornear. Luego los incluimos en la mezcla anterior y mezclamos hasta formar una pasta lisa y uniforme.
        Calentamos la waflera a la temperatura deseada y rociamos aceite en spray. Luego, colocamos la mezcla dentro y dejamos cocinar.
        Una vez listo, retirar el waffle, disponer sobre un plato y decorar con crema chantilly, frutillas, arándanos, hojas de menta y un generoso chorro de miel.
        ¡A disfrutar!''',
    urlImage:
        "https://cdn.shopify.com/s/files/1/0500/5121/9607/files/wafles.jpg?v=1630701223",
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xff0f4c5c).withOpacity(0.8),
                  ),
                  child: Text("Registrar receta"),
                ),
                RecetaCardWidget(recetaModel: receta1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
