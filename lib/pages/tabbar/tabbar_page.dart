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
          // bottom: TabBar(
          //   tabs: [
          //     Tab(icon: Icon(Icons.home), text: "Home"),
          //     Tab(icon: Icon(Icons.favorite), child: Text("Favorites")),
          //     Tab(icon: Icon(Icons.settings), text: "Configuracion"),
          //   ],
          // ),
        ),
        body: TabBarView(
          children: [InicioTab(), FavoritesTab(), SettingsTab()],
        ),
        // MOSTRAR EL TABBAR EN LA PARTE DE ABAJO DEL SCAFFOLD
        bottomNavigationBar: Material(
          child: SafeArea(
            top: false,
            child: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: "Home"),
                Tab(icon: Icon(Icons.favorite), child: Text("Favorites")),
                Tab(icon: Icon(Icons.settings), text: "Configuracion"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InicioTab extends StatefulWidget {
  @override
  State<InicioTab> createState() => _InicioTabState();
}

class _InicioTabState extends State<InicioTab>
    with AutomaticKeepAliveClientMixin {
  int _counter = 0;

  @override
  bool get wantKeepAlive => true; //mantener el estado al cambiar de tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("InicioTab")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("pestaña inicio"),
            SizedBox(height: 16),
            Text(
              "Contador: $_counter",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            FilledButton(
              onPressed: () {
                _counter++;
                setState(() {});
              },
              child: Text("Incrementar"),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("FavoritesTab")));
  }
}

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("SettingsTab")));
  }
}
