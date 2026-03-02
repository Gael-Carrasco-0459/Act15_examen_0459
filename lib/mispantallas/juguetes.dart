import 'package:flutter/material.dart';
import 'package:myapp/main.dart'; 

class ToysScreen extends StatelessWidget {
  const ToysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.all(15),
          child: Text("Juguetes Disponibles", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        HorizontalCard(nombre: "T-Rex Rexy", sub: "Sonidos realistas", img: "https://raw.githubusercontent.com/Gael-Carrasco-0459/Act10_disenio_pagina_JGCA_6J/refs/heads/main/61IaH3HKgdL._AC_UF894%2C1000_QL80_.jpg", precio: "\$899"),
        HorizontalCard(nombre: "Dilophosaurus", sub: "Ataque de veneno", img: "https://raw.githubusercontent.com/Gael-Carrasco-0459/Act10_disenio_pagina_JGCA_6J/refs/heads/main/61YzH1ITNiS.jpg", precio: "\$299"),
        HorizontalCard(nombre: "Indominus rex", sub: "Gigante 100cm", img: "https://raw.githubusercontent.com/Gael-Carrasco-0459/Act15_examen_0459/refs/heads/main/indo.PNG", precio: "\$1,500"),
        HorizontalCard(nombre: "Ankylosaurus", sub: "Bumpy Camp Cretaceous", img: "https://raw.githubusercontent.com/Gael-Carrasco-0459/Act10_disenio_pagina_JGCA_6J/refs/heads/main/712-F1uIWBL.jpg", precio: "\$380"),
      ],
    );
  }
}