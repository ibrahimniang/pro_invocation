import 'package:apil01/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/matin_page.dart';
import 'pages/tasbih_page.dart'; // ✅ Import de la page Tasbih
import 'pages/coran_page.dart';
import 'pages/noms_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.lightBlue),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Mes Invocations"),
        elevation: 15.0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber),
              child: Center(
                child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "parametre",
                style: TextStyle(color: Colors.lightBlue),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text("99 Noms", style: TextStyle(color: Colors.lightBlue)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NomsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text("Coran", style: TextStyle(color: Colors.lightBlue)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CoranPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text("Tasbih", style: TextStyle(color: Colors.lightBlue)),
              onTap: () {
                Navigator.pop(context); // Ferme le Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TasbihPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 4,
        children: [
          buildGridItem('Matin', 'assets/images/matin.jpeg', context),
          buildGridItem('Soir', 'assets/images/soir.jpeg', context),
          buildGridItem('Nuit', 'assets/images/nuit.jpeg', context),
          buildGridItem('Maison', 'assets/images/maison.jpeg', context),
          buildGridItem('Decés', 'assets/images/dece.jpeg', context),
          buildGridItem('Mosquée', 'assets/images/mosque.jpeg', context),
          buildGridItem('Voyage', 'assets/images/voyage.jpeg', context),
          buildGridItem('Habits', 'assets/images/habit.png', context),
          buildGridItem('Toilettes', 'assets/images/toilette.png', context),
          buildGridItem('Nourriture', 'assets/images/nouriture.jpeg', context),
          buildGridItem('Pluie ', 'assets/images/pluie.png', context),
          buildGridItem('Mariage ', 'assets/images/mariage.jpeg', context),
          buildGridItem('Sommeil', 'assets/images/sommeil.jpeg', context),
          buildGridItem('Ablution', 'assets/images/ablution.png', context),
          buildGridItem('Animaux', 'assets/images/animaux.jpeg', context),
          buildGridItem('Maladie', 'assets/images/malade.jpg', context),
          buildGridItem('Ramadan', 'assets/images/ramadan.jpeg', context),
          buildGridItem('Enfants', 'assets/images/enfants.jpeg', context),
          buildGridItem('Parents', 'assets/images/parents.jpeg', context),
          buildGridItem('Colére', 'assets/images/colere.jpeg', context),
          buildGridItem('Tristesse', 'assets/images/triste.jpeg', context),
          buildGridItem('Joie', 'assets/images/joie.jpeg', context),
          buildGridItem('Repentir ', 'assets/images/repentir.jpeg', context),
          buildGridItem('Richesse', 'assets/images/richesse.jpeg', context),
          buildGridItem('Hajj/Omra', 'assets/images/hajj_omra.jpeg', context),
          buildGridItem('Louange', 'assets/images/louag.png', context),
          buildGridItem('Prière', 'assets/images/priere.jpeg', context),
          buildGridItem('Société', 'assets/images/societe.jpeg', context),
          buildGridItem('Protection', 'assets/images/protection.png', context),
          buildGridItem('Tentation', 'assets/images/tentation.jpeg', context),
          buildGridItem('Savoir', 'assets/images/savoir.jpeg', context),
          buildGridItem('40 Rabbana', 'assets/images/rabbana.png', context),
          buildGridItem(
            'Invocations Personnelles',
            'assets/images/invocations.jpeg',
            context,
          ),
          buildGridItem('Bienfais ', 'assets/images/bienfaits.png', context),
        ],
      ),
    );
  }

  Widget buildGridItem(String title, String image, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == 'Matin') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MatinPage()),
          );
        }
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image, width: 60, height: 60),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
