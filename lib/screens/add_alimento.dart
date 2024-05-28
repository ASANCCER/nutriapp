import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutriapp/models/alimento.dart';
import 'package:nutriapp/screens/screens.dart';
import 'package:nutriapp/services/alimento_service.dart';
import 'package:nutriapp/utils/util.dart';
import 'package:provider/provider.dart';

class AddAlimento extends StatelessWidget {
  // ignore: use_super_parameters
  const AddAlimento({Key? key})
      : super(key: key); // Corrección en la declaración del constructor

  final comidas = const ['DESAYUNO', 'ALMUERZO', 'COMIDA', 'MERIENDA', 'CENA'];

  @override
  Widget build(BuildContext context) {
    //final conexion = Provider.of<AlimentoService>(context);
    //if (conexion.isLoading) return Loading();

    // GlobalKey para el formulario
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final GlobalKey<FormFieldState<String>> dropdownKey =
        GlobalKey<FormFieldState<String>>();
    final GlobalKey<FormFieldState<String>> dropdownKey2 =
        GlobalKey<FormFieldState<String>>();

    String? valor;
    String? tipoComida;
    int? gramos;

    return Scaffold(
      body: FutureBuilder(
          future: AlimentoService().getNombresAlimentos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Muestra un indicador de carga mientras se carga la lista de IDs
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // Muestra un mensaje de error si hay un error al cargar los datos
              return Text('Error: ${snapshot.error}');
            } else {
              // Muestra los IDs de los alimentos una vez que se han cargado
              final List<String> idsAlimentos = snapshot.data!;
              return Scaffold(
                  body: Container(
                    width: double.infinity,
                    height: Utiles.altoPantalla(context),
                    color: Colors.blueGrey.shade300,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: double.infinity,
                              height:
                                  Utiles.altoPantallaPorcentaje(context, 0.1),
                              color: Colors.black,
                              child: Utiles.textoCentrado(
                                  'NUEVO INGREDIENTE', Colors.white, 'newton')),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Form(
                                    key: formKey,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          DropdownButtonFormField(
                                              key: dropdownKey,
                                              style: Utiles.estilo(
                                                  Colors.black, 'dash'),
                                              items:
                                                  comidas.map((String comida) {
                                                return DropdownMenuItem(
                                                  value: comida,
                                                  child: Text(comida),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                tipoComida = value;
                                              },
                                              decoration: InputDecoration(
                                                hintText: 'COMIDA',
                                                hintStyle: Utiles.estilo(
                                                    Colors.black,
                                                    'dash'), // Aplicar el mismo estilo al hintText
                                              )),
                                          TextFormField(
                                            style: Utiles.estilo(
                                                Colors.black, 'dash'),
                                            decoration: const InputDecoration(
                                              hintText: 'GRAMOS',
                                            ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                              LengthLimitingTextInputFormatter(
                                                  5),
                                            ],
                                            onChanged: (value) {
                                              gramos = int.parse(value);
                                            },
                                          ),
                                          DropdownButtonFormField(
                                            key: dropdownKey2,
                                            value: valor,
                                            style: Utiles.estilo(
                                                Colors.black, 'dash'),
                                            items: idsAlimentos
                                                .toSet()
                                                .toList()
                                                /// limpiamos duplicados
                                                .map((String comida) {
                                              return DropdownMenuItem(
                                                value: comida,
                                                child: Text(comida),
                                              );
                                            }).toList(),
                                            onChanged: (value) {
                                              valor = value;
                                              if (idsAlimentos
                                                  .contains(valor)) {
                                                print('s');
                                              }
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'ALIMENTO',
                                              hintStyle: Utiles.estilo(
                                                  Colors.black,
                                                  'dash'), // Aplicar el mismo estilo al hintText
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                      backgroundColor: Colors.teal.shade900,
                      onPressed: () async {
                        // guardar alimentos
                        if (tipoComida != null &&
                            valor != null &&
                            gramos != null) {
                          Map<String, dynamic> data = {
                            'tipo': tipoComida,
                            'gramos': gramos,
                            'alimento': valor
                          };
                          bool sera = await AlimentoService()
                              .postAlimentos(data);
                          print(sera);
                        }
                      },
                      child: const Icon(
                        Icons.save,
                        color: Colors.white,
                      )));
            }
          }),
    );
  }
}
