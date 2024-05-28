import 'package:flutter/material.dart';
import 'package:nutriapp/utils/util.dart';
import 'package:nutriapp/widgets/alimento_imagen.dart';

class AlimentoScreen extends StatelessWidget {
  const AlimentoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const AlimentoImagen(),
                Positioned(
                    top: 30,
                    left: 30,
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back_ios))),
                Positioned(
                    top: 30,
                    right: 30,
                    child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.camera_alt_outlined)))
              ],
            ),
            const Formulario(
                titulo: 'Nombre del Alimento', tipoEntrada: TextInputType.name),
            const Formulario(
                titulo: 'Cantidad de grasas cada 100g',
                tipoEntrada: TextInputType.number),
            const Formulario(
                titulo: 'Cantidad de Hidratos cada 100g',
                tipoEntrada: TextInputType.number),
            const Formulario(
                titulo: 'Cantidad de Proteinas cada 100g',
                tipoEntrada: TextInputType.number),
            const Formulario(
                titulo: 'Cantidad de Calorias cada 100g',
                tipoEntrada: TextInputType.number),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                padding: const EdgeInsets.all(25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(200), // Borde redondeado
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text('GUARDAR',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    
                  ),
                  
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}

class Formulario extends StatelessWidget {
  final String titulo;
  final TextInputType tipoEntrada;
  const Formulario(
      {super.key, required this.titulo, required this.tipoEntrada});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        height: Utiles.altoPantallaPorcentaje(context, 0.1),
        decoration: decoracion(),
        child: Form(
            child: Column(
          children: [
            separador(),
            TextFormField(
                style: const TextStyle(color: Colors.white),
                keyboardType: tipoEntrada,
                decoration: InputDecoration(
                    hintText: titulo,
                    hintStyle: const TextStyle(color: Colors.white),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .white), // Color de la línea cuando el campo está enfocado
                    ),
                    border: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white), // Color de la línea por defecto
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .white), // Color de la línea cuando el campo está habilitado
                    ))),
          ],
        )),
      ),
    );
  }

  SizedBox separador() {
    return const SizedBox(
      height: 10,
    );
  }

  BoxDecoration decoracion() => BoxDecoration(
      color: Colors.blueGrey,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [sombraCard()]);

  BoxShadow sombraCard() {
    return const BoxShadow(
        color: Color.fromARGB(255, 36, 36, 36),
        offset: Offset(0, 7),
        blurRadius: 10);
  }
}
