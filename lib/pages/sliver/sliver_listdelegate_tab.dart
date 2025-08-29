import 'package:flutter/material.dart';

// útil cuando ua tenemos los widgets creados de antemano
//  menos flexible para listas enormes, perfecto cuando queremos bloques fijos

class SliverListdelegateTab extends StatelessWidget {
  const SliverListdelegateTab({super.key});

  @override
  Widget build(BuildContext context) {
    // ya tenemos los hijos creados(una lista corta estática)
    final children = List.generate(
      12,
      (i) => ListTile(
        leading: Icon(Icons.star_outline),
        title: Text("Elemento estático ${i + 1}"),
        subtitle: Text("Ya ha sido creado desde antes"),
      ),
    );
    return CustomScrollView(
      slivers: [
        SliverAppBar(pinned: true, title: Text("ListDelegate(estatico)")),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsetsGeometry.all(16),
                child: Text("Texto previo a la lista"),
              ),
              ...children,
              Container(
                height: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.indigo,
                ),
                child: Text("Bloque final, dentro del mismo sliverlist"),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
