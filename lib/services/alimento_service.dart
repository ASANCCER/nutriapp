import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nutriapp/models/alimento.dart';
import 'package:http/http.dart' as http;

class AlimentoService extends ChangeNotifier {
  final String _baseUrl =
      'nutricion-81db6-default-rtdb.europe-west1.firebasedatabase.app';
  final List<Alimento> alimentos = [];
  final List<String> idsAlimentos = [];
  bool isLoading = true;

  AlimentoService() {
    getAlimentos();
  }

  Future<List<Alimento>> getAlimentos() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'NUTRICION/ALIMENTOS.json');
    final respuesta = await http.get(url);
    final Map<String, dynamic> alimentosMap = json.decode(respuesta.body);

    alimentosMap.forEach((key, value) {
      final alimento = Alimento.fromJson(value);
      idsAlimentos.add(key);
      alimentos.add(alimento);
    });

    isLoading = false;
    notifyListeners();
    return alimentos;
  }

/// metodoe encargado de recorrer la lista de alimentos y obtener una lista de nombres.
  Future<List<String>> getNombresAlimentos() async {
  // Llamamos al método getAlimentos y esperamos a que se complete
  List<Alimento> listaDeAlimentos = await getAlimentos();
  List<String> nombres = [];

  // Recorremos la lista de alimentos
  for (Alimento alimento in listaDeAlimentos) {
    // Aquí puedes procesar cada alimento como necesites
    nombres.add(alimento.nombre);
  }

  return nombres;
}




  List<Alimento> getAlimentos2() => alimentos;
  List<String> getAlimentosKey2() => idsAlimentos;

  Future<List<String>> getAlimentosKey() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'NUTRICION/ALIMENTOS.json');
    final respuesta = await http.get(url);
    final Map<String, dynamic> alimentosMap = json.decode(respuesta.body);

    alimentosMap.forEach((key, value) {
      idsAlimentos.add(key);
    });

    isLoading = false;
    notifyListeners();
    return idsAlimentos;
  }

  Future<bool> postAlimentos(Map<String, dynamic> alimentos) async {
    isLoading = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'NUTRICION/ALIMENTOS.json');
    final respuesta = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(alimentos),
    );

    isLoading = false;
    notifyListeners();
    if (respuesta.statusCode == 200) {
      return true;
    } else {
      // Manejar la respuesta no exitosa
      throw Exception('Error en la solicitud POST: ${respuesta.statusCode}');
    }
  }
}
