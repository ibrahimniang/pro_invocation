import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart'; // Import de firebase_storage
import 'package:audioplayers/audioplayers.dart'; // Import de audioplayers

class MatinPage extends StatefulWidget {
  @override
  _MatinPageState createState() => _MatinPageState();
}

class _MatinPageState extends State<MatinPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Initialisation de Firebase Storage
  late FirebaseStorage storage;

  @override
  void initState() {
    super.initState();
    // Initialiser Firebase Storage après l'initialisation de Firebase
    storage = FirebaseStorage.instance;
  }

  // Fonction pour récupérer l'URL de l'audio depuis Firebase Storage
  Future<String> getAudioUrl() async {
    try {
      // Remplacer 'path_to_your_audio_file' par le chemin réel de ton fichier dans Firebase Storage
      String url =
          await storage.ref('path_to_your_audio_file').getDownloadURL();
      return url;
    } catch (e) {
      print("Erreur lors de la récupération de l'audio: $e");
      return "";
    }
  }

  // Fonction pour jouer l'audio
  void _playAudio() async {
    String url = await getAudioUrl();
    if (url.isNotEmpty) {
      try {
        // Utiliser UrlSource pour jouer l'audio
        await _audioPlayer.play(UrlSource(url));
      } catch (e) {
        print("Erreur lors de la lecture de l'audio: $e");
      }
    } else {
      // Afficher une erreur si l'URL est vide
      print("URL vide, impossible de jouer l'audio.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("le matin"),
        elevation: 12.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'الحمد لله الذي أحيانا بعد ما أماتنا وإليه النشور',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Al-hamdu li-llahi al-ladhi ahyana ba’da ma amatana wa ilayhi n-nushur',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _playAudio, // Appeler la fonction pour jouer l'audio
              child: Text('Jouer l\'audio'),
            ),
          ],
        ),
      ),
    );
  }
}
