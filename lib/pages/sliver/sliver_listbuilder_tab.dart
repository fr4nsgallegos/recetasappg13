import 'package:flutter/material.dart';

class SliverListbuilderTab extends StatelessWidget {
  int cantidad = 50;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 140,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Builder (perezoso)"),
            collapseMode: CollapseMode.parallax,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverList(
            // buildeR: crea bajo demanda lo que se va a mostrar en pantalla (funcionamiento parecido a listview.builder para mejorar rendimiento)
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                print(index);
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text("${index + 1}")),
                    title: Text("Producto  $index"),
                    subtitle: Text("Construido bajo demanda"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                );
              },
              childCount:
                  cantidad, //por defecto es null, si es asi la cantidad de elementos a contruir es infinita
              addRepaintBoundaries: true, //optimizar el repintado
              addSemanticIndexes: true, //accesibilidad
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Center(child: Text("Fin de la lista (builder)")),
          ),
        ),
      ],
    );
  }
}
