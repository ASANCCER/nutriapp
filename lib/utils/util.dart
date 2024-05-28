import 'package:flutter/material.dart';
import 'package:nutriapp/models/alimento.dart';

class Utiles {
  // Definición de una variable estática
  static double alto = 0;
  static String palabra = 'patatuelas';

  static double altoPantalla(BuildContext context) {
    alto = MediaQuery.of(context).size.height;
    return alto;
  }

  static double altoPantallaPorcentaje(
      BuildContext context, double porcentaje) {
    alto = MediaQuery.of(context).size.height * porcentaje;
    return alto;
  }

  static String getPalabra() {
    return palabra;
  }

  static Alimento getAlimento() {
    return Alimento(
      nombre: "pataaata",
        grasas: 20.6,
        hidratos: 40.8,
        proteinas: 6.3,
        gramos: 200,
        calorias: 376);
  }

  static TextStyle estilo(Color color, String font) {
    return TextStyle(
        color: color,
        decoration: TextDecoration.none,
        fontFamily: font,
        letterSpacing: 5);
  }

  static TextStyle estiloBlanco(Color color, String font) {
    return TextStyle(
        color: color,
        decoration: TextDecoration.none,
        fontFamily: font,
        letterSpacing: 5);
  }

  static Center textoCentrado(String titulo, Color color, String font) {
    return Center(
      child: Text(
        titulo,
        style: estilo(color, font),
      ),
    );
  }

  static GestureDetector botonTitulo(BuildContext context, double height,
      Color fondo, Color letra, String titulo, String fuente) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context,'MENU'),
      child: Container(
          width: double.infinity,
          height: height,
          color: fondo,
          child: Utiles.textoCentrado(titulo, letra, fuente)),
    );
  }
}
