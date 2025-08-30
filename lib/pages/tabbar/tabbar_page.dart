import 'package:flutter/material.dart';

class TabbarPage extends StatelessWidget {
  const TabbarPage({super.key});

  // Cantidad de tabs que voy a tener, DEBE COINCIDIR CON TABS Y TABBARVIEW
  static const int _tabCount = 3;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: _tabCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Ejemplo de tabbar"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.favorite), child: Text("Favorites")),
              Tab(icon: Icon(Icons.settings), text: "Configuracion"),
            ],
          ),
        ),
        body: TabBarView(children: [Text("1"), Text("2"), Text("3")]),
      ),
    );
  }
}
