import 'package:flutter/material.dart';
import 'package:nutriapp/widgets/seccion.dart';

class CardviewScreen extends StatelessWidget {
  final opciones = const ['DIARIO', 'ALIMENTOS', 'RECETAS', 'MEDICIONES'];
  final imagenes = const [
    AssetImage('lib/images/diario.jpg'),
    AssetImage('lib/images/alimentos.jpg'),
    AssetImage('lib/images/recetas.jpg'),
    AssetImage('lib/images/mediciones.jpg')
  ];
  const CardviewScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: ListView.builder(
            itemCount: opciones.length,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () => Navigator.pushNamed(context,opciones[index]),
                  child: Seccion(
                    titulo: opciones[index],
                    imagen: imagenes[index],
                  ),
                )));
  }
}
