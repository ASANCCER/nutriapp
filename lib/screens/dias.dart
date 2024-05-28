import 'package:flutter/material.dart';
import 'package:nutriapp/utils/util.dart';

class Dias extends StatelessWidget {
  const Dias({super.key});

  @override
  Widget build(BuildContext context) {
    double alto = Utiles.altoPantalla(context)/7;
    Color fondo = Colors.black;
    Color letra = Colors.white;
    String fuente = 'newton';

    return Container(
        width: double.infinity,
        color: Colors.blueGrey.shade300,
        child: Column(
          children: [
            Utiles.botonTitulo(context, alto, fondo, letra, 'LUNES', fuente),
            Utiles.botonTitulo(context, alto, fondo, letra, 'MARTES', fuente),
            Utiles.botonTitulo(context, alto, fondo, letra, 'MIERCOLES', fuente),
            Utiles.botonTitulo(context, alto, fondo, letra, 'JUEVES', fuente),
            Utiles.botonTitulo(context, alto, fondo, letra, 'VIERNES', fuente),
            Utiles.botonTitulo(context, alto, fondo, letra, 'SABADO', fuente),
            Utiles.botonTitulo(context, alto, fondo, letra, 'DOMINGO', fuente)
          ],
        ),
      );
  }

  
}