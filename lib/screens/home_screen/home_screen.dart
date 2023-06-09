import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../map_screen/map_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int windowPage = 10;

  String userId = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('URBS'),
      ),
      body: const MapScreen(),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.directions_bus_filled_rounded),
              title: const Text("Todas as linhas"),
              onTap: () {
                irParaLinhas();
              },
            ),
            ListTile(
              leading: const Icon(Icons.format_list_bulleted_sharp),
              title: const Text("Itinerários"),
              onTap: () {
                irParaItinerario();
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text("Linhas favoritas"),
              onTap: () {
                irParaLinhasFavoritas();
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Sair"),
              onTap: () {
                logout();
              },
            )
          ],
        ),
      ),
    );
  }

  irParaItinerario() {
    Navigator.pushNamed(context, 'itinerario');
  }

  irParaLinhasFavoritas() {
    Navigator.pushNamed(context, 'linhasFavoritas');
  }

  irParaLinhas() {
    Navigator.pushNamed(context, 'linhas');
  }

  logout() {
    SharedPreferences.getInstance().then((sharedPreferences) {
      sharedPreferences.remove('accessToken');
      sharedPreferences.remove('id');
      sharedPreferences.remove('email');

      Navigator.pushReplacementNamed(context, 'login');
    });
  }

}
