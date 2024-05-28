// To parse this JSON data, do
//
//     final alimento = alimentoFromJson(jsonString);

import 'dart:convert';

Map<String, Alimento> alimentoFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, Alimento>(k, Alimento.fromJson(v)));

String alimentoToJson(Map<String, Alimento> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Alimento {
    double calorias;
    double gramos;
    double grasas;
    double hidratos;
    String nombre;
    double proteinas;

    Alimento({
        required this.calorias,
        required this.gramos,
        required this.grasas,
        required this.hidratos,
        required this.nombre,
        required this.proteinas,
    });

    factory Alimento.fromJson(Map<String, dynamic> json) => Alimento(
        calorias: json["CALORIAS"]?.toDouble(),
        gramos: json["GRAMOS"]?.toDouble(),
        grasas: json["GRASAS"]?.toDouble(),
        hidratos: json["HIDRATOS"]?.toDouble(),
        nombre: json["NOMBRE"],
        proteinas: json["PROTEINAS"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "CALORIAS": calorias,
        "GRAMOS": gramos,
        "GRASAS": grasas,
        "HIDRATOS": hidratos,
        "NOMBRE": nombre,
        "PROTEINAS": proteinas,
    };
}
