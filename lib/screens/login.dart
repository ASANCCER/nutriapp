import 'package:flutter/material.dart';
import 'package:nutriapp/utils/util.dart';
import 'package:nutriapp/widgets/card.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: Utiles.altoPantallaPorcentaje(context, 0.3),
            color: Colors.teal.shade900,
            child: Utiles.textoCentrado("NUTRICION", Colors.teal, "newton"),
          ),
          Container(
              width: double.infinity,
              height: Utiles.altoPantallaPorcentaje(context, 0.7),
              color: Colors.teal.shade900,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: Utiles.altoPantallaPorcentaje(context, 0.4),
                      child: CardContainer(
                          child: Column(
                        children: [
                          Utiles.textoCentrado("LOGIN ", Colors.teal, "newton"),
                          loginForm(context),
                        ],
                      )),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Padding loginForm(BuildContext context) {

    String? usuario;
    String? pass;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                style: Utiles.estilo(Colors.black, "dash"),
                decoration: const InputDecoration(hintText: 'USUARIO'),
                validator: (value) {
                  usuario = value;
                  if (null == value || value.trim().isEmpty) {
                    value = null;
                    usuario = value;
                    return 'Es necesario introducir datos';
                  }
                  return null;
                },
              ),
              TextFormField(
                style: Utiles.estilo(Colors.black, "dash"),
                decoration: const InputDecoration(hintText: '*******'),
                validator: (value) {
                  pass = value;
                  if (null == value || value.trim().isEmpty) {
                    value = null;
                    pass = value;
                    return 'Es necesario introducir datos';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: OutlinedButton(
                    onPressed: () {
                      if(null != usuario || null != pass) {
                        // iniciar sesion
                      }
                    },
                    child: Utiles.textoCentrado(
                        "INICIAR SESION", Colors.teal, "dash")),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: OutlinedButton(
                    onPressed: () {
                      if(null != usuario || null != pass) {
                        // guardar datos
                        if(usuario=='atleti' && pass == 'cholo'){
                          Navigator.pushNamed(context, 'home');
                        }
                      }
                    },
                    child: Utiles.textoCentrado(
                        "CREAR CUENTA", Colors.teal, "dash")),
              )
            ],
          )),
    );
  }
}
