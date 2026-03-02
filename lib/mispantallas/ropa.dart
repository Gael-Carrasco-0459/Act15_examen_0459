import 'package:flutter/material.dart';
import 'package:myapp/main.dart'; 

class RopaScreen extends StatelessWidget {
  const RopaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.all(15),
          child: Text("Colección de Ropa", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        HorizontalCard(nombre: "Playera Park Logo", sub: "Talla M", img: "https://raw.githubusercontent.com/Gael-Carrasco-0459/Act11_segunda_pantalla_JGCA_0459/refs/heads/main/playera.JPG", precio: "\$250"),
        HorizontalCard(nombre: "Sudadera Dino", sub: "Talla L", img: "https://raw.githubusercontent.com/Gael-Carrasco-0459/Act15_examen_0459/refs/heads/main/sudadera.PNG", precio: "\$550"),
        HorizontalCard(nombre: "Gorra Jurassic", sub: "Ajustable", img: "https://raw.githubusercontent.com/Gael-Carrasco-0459/Act15_examen_0459/refs/heads/main/gorra.PNG", precio: "\$180"),
        HorizontalCard(nombre: "Calcetas Raptor", sub: "Pack 3 pares", img: "https://raw.githubusercontent.com/Gael-Carrasco-0459/Act15_examen_0459/refs/heads/main/calcetas.PNG", precio: "\$120"),
      ],
    );
  }
}