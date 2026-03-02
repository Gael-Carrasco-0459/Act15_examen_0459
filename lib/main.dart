import 'package:flutter/material.dart';
// Asegúrate de poner la ruta correcta según tu carpeta
import 'package:myapp/mispantallas/inicio.dart';
import 'package:myapp/mispantallas/juguetes.dart';
import 'package:myapp/mispantallas/ropa.dart';
void main() => runApp(const SpideySaurusApp());

// --- MODELOS DE DATOS ---
class AppScreenData {
  final String name;
  final IconData icon;
  final Widget page;
  final int index;

  const AppScreenData({
    required this.name,
    required this.icon,
    required this.page,
    required this.index,
  });
}

class FooterButtonData {
  final IconData icon;
  final int? targetPageIndex;
  const FooterButtonData({required this.icon, this.targetPageIndex});
}

// --- CONFIGURACIÓN DE LA APP ---
class SpideySaurusApp extends StatelessWidget {
  const SpideySaurusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, 
            color: Colors.white, 
            fontSize: 20
          ),
        ),
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Definición de las pantallas principales
  final List<AppScreenData> _appScreens = const [
    AppScreenData(name: 'Inicio', icon: Icons.home, page: HomeScreen(), index: 0),
    AppScreenData(name: 'Juguetes', icon: Icons.toys, page: ToysScreen(), index: 1),
    AppScreenData(name: 'Ropa', icon: Icons.checkroom, page: RopaScreen(), index: 2),
  ];

  // Configuración del footer
  final List<FooterButtonData> _footerItems = const [
    FooterButtonData(icon: Icons.home, targetPageIndex: 0),
    FooterButtonData(icon: Icons.calendar_today, targetPageIndex: null),
    FooterButtonData(icon: Icons.list_alt, targetPageIndex: 1),
    FooterButtonData(icon: Icons.person, targetPageIndex: 2),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Spidey-Saurus'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none), 
            onPressed: () {}
          )
        ],
      ),
      body: Column(
        children: [
          // 1. BARRA AMARILLA (CATEGORÍAS)
          Container(
            color: Colors.yellow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _appScreens.map((screen) => TextButton.icon(
                onPressed: () => _onItemTapped(screen.index),
                icon: Icon(screen.icon, color: Colors.black, size: 16),
                label: Text(
                  screen.name,
                  style: TextStyle(
                    color: _selectedIndex == screen.index ? Colors.orange[900] : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )).toList(),
            ),
          ),

          // 2. MENÚ DE CÍRCULOS (IMÁGENES WEB)
          const CircleAvatarMenu(),

          // 3. ÁREA DE CONTENIDO (INICIO / JUGUETES / ROPA)
          Expanded(child: _appScreens[_selectedIndex].page),

          // 4. FOOTER (BARRA BLANCA)
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _footerItems.map((item) => GestureDetector(
                onTap: item.targetPageIndex != null 
                    ? () => _onItemTapped(item.targetPageIndex!) 
                    : null,
                child: Icon(
                  item.icon,
                  color: item.targetPageIndex == _selectedIndex ? Colors.red : Colors.grey[600],
                  size: 30,
                ),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// --- COMPONENTE: Círculos Superiores ---
class CircleAvatarMenu extends StatelessWidget {
  const CircleAvatarMenu({super.key});

  final List<String> images = const [
    'https://raw.githubusercontent.com/Gael-Carrasco-0459/Act10_disenio_pagina_JGCA_6J/refs/heads/main/61IaH3HKgdL._AC_UF894%2C1000_QL80_.jpg',
    'https://raw.githubusercontent.com/Gael-Carrasco-0459/Act10_disenio_pagina_JGCA_6J/refs/heads/main/712-F1uIWBL.jpg',
    'https://raw.githubusercontent.com/Gael-Carrasco-0459/Act10_disenio_pagina_JGCA_6J/refs/heads/main/61YzH1ITNiS.jpg',
    'https://raw.githubusercontent.com/Gael-Carrasco-0459/Act11_segunda_pantalla_JGCA_0459/refs/heads/main/playera.JPG',
    'https://raw.githubusercontent.com/Gael-Carrasco-0459/Act13_nav_nego_JGCA_0459/refs/heads/main/Jurassic-Outfitters-in-Universals-Islands-of-Adventure.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.red,
              child: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(images[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}

// --- COMPONENTE GLOBAL: Tarjeta Horizontal ---
class HorizontalCard extends StatelessWidget {
  final String nombre, sub, img, precio;
  const HorizontalCard({
    super.key, 
    required this.nombre, 
    required this.sub, 
    required this.img, 
    this.precio = ""
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.red.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(15)),
            child: Image.network(img, width: 100, height: 100, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(nombre, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  Text(sub, style: TextStyle(color: Colors.grey[400], fontSize: 11)),
                  if (precio.isNotEmpty) 
                    Text(precio, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.chevron_right, color: Colors.red),
          ),
        ],
      ),
    );
  }
}