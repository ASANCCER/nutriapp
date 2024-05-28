import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:nutriapp/services/alimento_service.dart';
import 'package:nutriapp/utils/util.dart';

class AddDataAlimento extends StatelessWidget {
  const AddDataAlimento({super.key});

  @override
  Widget build(BuildContext context) {
    String? nombre;
    double? gramos;
    double? grasas;
    double? hidratos;
    double? proteinas;
    double? calorias;

    return Scaffold(
        body: Container(
          width: double.infinity,
          height: Utiles.altoPantalla(context),
          color: Colors.blueGrey.shade300,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
                width: double.infinity,
                height: Utiles.altoPantallaPorcentaje(context, 0.1),
                color: Colors.black,
                child: Utiles.textoCentrado(
                    'NUEVO ALIMENTO', Colors.white, 'newton')),
            Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      style: Utiles.estilo(Colors.black, 'dash'),
                      decoration: const InputDecoration(
                        hintText: 'NOMBRE DEL ALIMENTO',
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.singleLineFormatter,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      onChanged: (value) {
                        nombre = value;
                      },
                    ),
                    TextFormField(
                      style: Utiles.estilo(Colors.black, 'dash'),
                      decoration: const InputDecoration(
                        hintText: 'GRAMOS',
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(5),
                      ],
                      onChanged: (value) {
                        gramos = double.parse(value);
                      },
                    ),
                    TextFormField(
                      style: Utiles.estilo(Colors.black, 'dash'),
                      decoration: const InputDecoration(
                        hintText: 'GRASAS',
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(5),
                      ],
                      onChanged: (value) {
                        grasas = double.parse(value);
                      },
                    ),
                    TextFormField(
                      style: Utiles.estilo(Colors.black, 'dash'),
                      decoration: const InputDecoration(
                        hintText: 'HIDRATOS',
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(5),
                      ],
                      onChanged: (value) {
                        hidratos = double.parse(value);
                      },
                    ),
                    TextFormField(
                      style: Utiles.estilo(Colors.black, 'dash'),
                      decoration: const InputDecoration(
                        hintText: 'PROTEINAS',
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(5),
                      ],
                      onChanged: (value) {
                        proteinas = double.parse(value);
                      },
                    ),
                    TextFormField(
                      style: Utiles.estilo(Colors.black, 'dash'),
                      decoration: const InputDecoration(
                        hintText: 'CALORIAS',
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(5),
                      ],
                      onChanged: (value) {
                        calorias = double.parse(value);
                      },
                    )
                  ],
                )))
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.teal.shade900,
            onPressed: () async {
              // guardar alimentos
              if (nombre != null &&
                  gramos != null &&
                  grasas != null &&
                  hidratos != null &&
                  proteinas != null &&
                  calorias != null) {
                Map<String, dynamic> data = {
                  "CALORIAS": calorias,
                  "GRAMOS": gramos,
                  "GRASAS": grasas,
                  "HIDRATOS": hidratos,
                  "NOMBRE": nombre,
                  "PROTEINAS": proteinas,
                };
                bool sera =
                    await AlimentoService().postAlimentos(data);
                print(sera);
              }
            },
            child: const Icon(
              Icons.save,
              color: Colors.white,
            )));
  }
}
