import 'package:flutter/material.dart';
import 'package:myapp/main.dart';  // Importamos para usar HorizontalCard si está en main

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        // Banner principal
        BannerHome(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text("Destacados", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        HorizontalCard(nombre: "Indominus Rex", sub: "Colección Premium", img: "https://raw.githubusercontent.com/Gael-Carrasco-0459/Act15_examen_0459/refs/heads/main/indo.PNG", precio: "\$1,200"),
        HorizontalCard(nombre: "T-Rex Clásico", sub: "Jurassic World Edition", img: "https://raw.githubusercontent.com/Gael-Carrasco-0459/Act10_disenio_pagina_JGCA_6J/refs/heads/main/61IaH3HKgdL._AC_UF894%2C1000_QL80_.jpg", precio: "\$899"),
        HorizontalCard(nombre: "Velociraptor Blue", sub: "Articulado", img: "https://raw.githubusercontent.com/Gael-Carrasco-0459/Act10_disenio_pagina_JGCA_6J/refs/heads/main/61YzH1ITNiS.jpg", precio: "\$350"),
        HorizontalCard(nombre: "Triceratops", sub: "Legacy Collection", img: "https://raw.githubusercontent.com/Gael-Carrasco-0459/Act10_disenio_pagina_JGCA_6J/refs/heads/main/712-F1uIWBL.jpg", precio: "\$450"),
      ],
    );
  }
}

class BannerHome extends StatelessWidget {
  const BannerHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: const DecorationImage(
          image: NetworkImage('https://raw.githubusercontent.com/Gael-Carrasco-0459/Act13_nav_nego_JGCA_0459/refs/heads/main/Jurassic-Outfitters-in-Universals-Islands-of-Adventure.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}