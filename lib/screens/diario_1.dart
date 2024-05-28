import 'package:flutter/material.dart';
import 'package:nutriapp/models/alimento.dart';
import 'package:nutriapp/utils/util.dart';

class Diario1 extends StatelessWidget {
  const Diario1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: double.infinity,
              color: Colors.blueGrey.shade300,
              child: Column(
                children: [
                  dia(context, 'DESAYUNO'),
                  tablaDiaria(context),
                  dia(context, 'ALMUERZO'),
                  tablaDiaria(
                    context,
                  ),
                  dia(context, 'COMIDA'),
                  tablaDiaria(
                    context,
                  ),
                  dia(context, 'MERIENDA'),
                  tablaDiaria(
                    context,
                  ),
                  dia(context, 'CENA'),
                  tablaDiaria(
                    context,
                  ),
                ],
              ),
            ),
          ),
          Utiles.botonVolver(context, 'DIARIO')
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal.shade900,
        onPressed: () => Navigator.pushNamed(context, 'ADD_ALIMENTO'),
        child: const Icon(Icons.add, color: Colors.white,)
        ),
    );
  }

  Container dia(BuildContext context, String dia) {
    return Container(
        width: double.infinity,
        height: Utiles.altoPantallaPorcentaje(context, 0.07),
        color: Colors.black,
        child: Center(
          child: FittedBox(
            child: Text(dia,
                style: const TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontFamily: 'dash',
                    letterSpacing: 5)),
          ),
        ));
  }

  Table tablaDiaria(BuildContext context) {
    return Table(
        columnWidths: const {
          0: FractionColumnWidth(0.4), // Primera columna ocupa el 40%
          1: FractionColumnWidth(0.12), // Siguiente columna ocupa el 12%
          2: FractionColumnWidth(0.12), // Siguiente columna ocupa el 12%
          3: FractionColumnWidth(0.12), // Siguiente columna ocupa el 12%
          4: FractionColumnWidth(0.12), // Siguiente columna ocupa el 12%
          5: FractionColumnWidth(0.12), // Siguiente columna ocupa el 12%
        },
        border: const TableBorder(
          horizontalInside: BorderSide(color: Colors.black),
          bottom: BorderSide(color: Colors.black),
          top: BorderSide(color: Colors.black),
        ),
        children: [
          cabecera(context),
          fila(context, Utiles.getAlimento(), Colors.teal.shade300,
              Colors.cyan.shade100, Colors.black),
          fila(context, Utiles.getAlimento(), Colors.teal.shade300,
              Colors.cyan.shade100, Colors.black),
          fila(context, Utiles.getAlimento(), Colors.teal.shade300,
              Colors.cyan.shade100, Colors.black),
          fila(context, Utiles.getAlimento(), Colors.teal.shade300,
              Colors.cyan.shade100, Colors.black),
          fila(context, Utiles.getAlimento(), Colors.teal.shade300,
              Colors.cyan.shade100, Colors.black),
          fila(context, Utiles.getAlimento(), Colors.teal.shade300,
              Colors.cyan.shade100, Colors.black),
          fila(context, Utiles.getAlimento(), Colors.teal.shade300,
              Colors.cyan.shade100, Colors.black)
        ]);
  }

  /// METODO ENCARGADO DE MONTAR LA CABECERA
  TableRow cabecera(BuildContext context) {
    return TableRow(children: [
      celdaCabecera(context, 'NOMBRE'),
      celdaCabecera(context, 'GRAMOS'),
      celdaCabecera(context, 'GRASAS'),
      celdaCabecera(context, 'HIDRATOS'),
      celdaCabecera(context, 'PROTEINA'),
      celdaCabecera(context, 'CALORIAS'),
    ]);
  }

  /// CELDA DE LA CABECERA
  Container celdaCabecera(BuildContext context, String titulo) => Container(
        width: double.infinity,
        height: Utiles.altoPantallaPorcentaje(context, 0.07),
        color: Colors.teal.shade900,
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: FittedBox(
                  child: Text(titulo, style: Utiles.estilo(Colors.white, 'dash')),
                  ),
            )),
      );

  /// CADA UNA DE LAS FILAS DE LA TABLA
  TableRow fila(BuildContext context, Alimento alimento, Color fondo1,
      Color fondo2, Color letra) {
    return TableRow(children: [
      celdaTitulo(context, fondo1, alimento.grasas.toString(), letra),
      celda(context, fondo2, alimento.grasas.toString(), letra),
      celda(context, fondo1, alimento.grasas.toString(), letra),
      celda(context, fondo2, alimento.hidratos.toString(), letra),
      celda(context, fondo1, alimento.proteinas.toString(), letra),
      celda(context, fondo2, alimento.calorias.toString(), letra),
    ]);
  }

  Container celdaTitulo(
          BuildContext context, Color fondo, String contenido, Color letra) =>
      Container(
        width: double.infinity,
        height: Utiles.altoPantallaPorcentaje(context, 0.07),
        color: fondo,
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: FittedBox(
                  child: Text(contenido, style: Utiles.estilo(letra, 'dash')),
                  ),
            )),
      );

  Container celda(
          BuildContext context, Color fondo, String contenido, Color letra) =>
      Container(
        width: 10,
        height: Utiles.altoPantallaPorcentaje(context, 0.07),
        color: fondo,
        child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                  child: Text(contenido, style: Utiles.estilo(letra, 'dash')),
                  ),
            )),
      );
}
