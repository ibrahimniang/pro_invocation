import 'package:flutter/material.dart';

class NomsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("🌟 99 Noms d'Allah"),
         elevation: 12.0,
      ),
      body: Center(
        child: Text(
          "🌟 Les 99 Noms d'Allah",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
