import 'package:flutter/material.dart';

import '../utils/util.dart';

class AlimentoImagen extends StatelessWidget {
  const AlimentoImagen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: (Utiles.altoPantallaPorcentaje(context, 0.4)) ,
        decoration: decoracionCard(Colors.blueGrey, Colors.white),
        child: const FadeInImage(
          image: NetworkImage(
              'https://imgs.search.brave.com/tRcBhdBSbsN5tEfeet7lCrjtGWFyBEjNLecoLJKYKUo/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9jZG4u/Yml3ZW5nZXIuY29t/L2kvdC8yLnBuZw'),
          placeholder: AssetImage('lib/images/diario.jpg'),
        ),
      ),
    );
  }

  BoxDecoration decoracionCard(Color color1, Color color2) => BoxDecoration(
      gradient: LinearGradient(
        colors: [color1, color2], // Colores del gradiente
        begin: Alignment.topLeft, // Dirección de inicio del gradiente
        end: Alignment.bottomRight, // Dirección de fin del gradiente
      ),
      color: Colors.blueGrey,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [sombraCard()]);

  BoxShadow sombraCard() {
    return const BoxShadow(
        color: Color.fromARGB(255, 36, 36, 36),
        offset: Offset(0, 7),
        blurRadius: 10);
  }
}
