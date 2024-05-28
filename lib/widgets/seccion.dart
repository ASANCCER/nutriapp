import 'package:flutter/material.dart';
import 'package:nutriapp/utils/util.dart';

class Seccion extends StatelessWidget {
  final String titulo;
  final ImageProvider imagen;
  const Seccion({super.key, required this.titulo, required this.imagen});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          width: double.infinity,
          height: Utiles.altoPantallaPorcentaje(context, 0.3),
          decoration: decoracionCard(Colors.blueGrey, Colors.blueGrey.shade400),
          child: Stack(children: [
            Column(
              children: [
                FondoCard(imagen: imagen,),
                TituloCard(
                  titulo: titulo,
                ),
              ],
            )
          ]),
        ));
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

class TituloCard extends StatelessWidget {
  final String titulo;

  const TituloCard({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: (Utiles.altoPantallaPorcentaje(context, 0.3)) * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 34, // Tamaño grande de la letra
                color: Colors.white, // Color gris
                fontWeight: FontWeight.bold, // Negrita para resaltar
                fontFamily: 'newton',
                letterSpacing: 5
              ))
        ],
      ),
    );
  }
}

class FondoCard extends StatelessWidget {
  final ImageProvider imagen;
  const FondoCard({
    super.key,
    required this.imagen
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: (Utiles.altoPantallaPorcentaje(context, 0.3)) * 0.7,
      decoration: decoracionCard(Colors.white, Colors.grey, imagen),
    );
  }

  BoxDecoration decoracionCard(Color color1, Color color2, ImageProvider image) => BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2], // Colores del gradiente
          begin: Alignment.topLeft, // Dirección de inicio del gradiente
          end: Alignment.bottomRight, // Dirección de fin del gradiente
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        image: DecorationImage(
      image: image, 
      fit: BoxFit.cover, 
    ),
      );
}
