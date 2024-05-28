import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nutriapp/firebase_options.dart';
import 'package:nutriapp/services/alimento_service.dart';
import 'package:provider/provider.dart';
import 'package:nutriapp/screens/screens.dart';

//void main() => runApp(const AppState());

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AlimentoService()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NUTRICION',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => const CardviewScreen(),
        'ALIMENTOS': (BuildContext context) => const AlimentoScreen(),
        'MENU': (BuildContext context) => const Diario1(),
        'DIARIO': (BuildContext context) => const Dias(),
        'ADD_ALIMENTO' : (BuildContext context) => const AddAlimento(),
        'LOGIN' : (BuildContext context) => const LoginScreen(),
        'DATA_ALIMENTO' : (BuildContext context) => const AddDataAlimento(),
      },
    );
  }
}
