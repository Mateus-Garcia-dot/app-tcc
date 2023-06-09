import 'package:app_tcc/screens/itinerario_screen/itinerario_screen.dart';
import 'package:app_tcc/screens/linhas_favoritas_screen/linhas_favoritas_screen.dart';
import 'package:app_tcc/screens/linhas_screen/linhas_screen.dart';
import 'package:app_tcc/screens/login_screen/login_screen.dart';
import 'package:app_tcc/services/linha_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isLogged = await verifyToken();

  runApp(
      MultiProvider(
      providers: [
        Provider<LinhasService>(create: (_) => LinhasService()),
      ],
          child: MyApp(isLogged: isLogged)
  ));
}

Future<bool> verifyToken() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  //TODO: Criar uma classe de valores
  String? token = sharedPreferences.getString('accessToken');
  if (token != null) {
    return true;
  }
  return false;
}

class MyApp extends StatelessWidget {
  final bool isLogged;
  const MyApp({Key? key, required this.isLogged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'URBS',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.white),
          actionsIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      initialRoute: (isLogged) ? "home" : "login",
      routes: {
        "home": (context) => const HomeScreen(),
        "login": (context) => LoginScreen(),
        "linhasFavoritas": (context) => const LinhasFavoritasScreen(),
        "linhas": (context) => const LinhasScreen(),
        "itinerario": (context) => const ItinerarioScreen()
      },
    );
  }
}
