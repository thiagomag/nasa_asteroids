import 'package:flutter/material.dart';
import 'asteroid.dart';
import 'asteroids_api.dart';

void main() {
  runApp(const AsteroidsScreen());
}

class AsteroidsScreen extends StatefulWidget {
  const AsteroidsScreen({super.key});

  @override
  _AsteroidsScreenState createState() => _AsteroidsScreenState();
}

class _AsteroidsScreenState extends State<AsteroidsScreen> {
  late Future<List<Asteroid>> _futureAsteroids;

  @override
  void initState() {
    super.initState();
    _futureAsteroids = AsteroidsApi.getAsteroids();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define o idioma do app
      locale: Locale("pt", "BR"),
      // Define o widget MaterialLocalizations como ancestral do Scaffold
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Asteroides"),
          ),
          body: FutureBuilder<List<Asteroid>>(
            future: _futureAsteroids,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return ListView(
                  children: snapshot.data!.map((asteroid) {
                    return Card(
                      child: ListTile(
                        title: Text(asteroid.name),
                        subtitle: Text(
                            "Data de aproximação: ${asteroid.closeApproachDate} | Distância da Terra: ${asteroid.missDistance} | Tamanho do asteroide: ${asteroid.diameter}"),
                      ),
                    );
                  }).toList(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}