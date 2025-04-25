import 'package:flutter/material.dart';

class TasbihPage extends StatefulWidget {
  const TasbihPage({super.key});

  @override
  State<TasbihPage> createState() => _TasbihPageState();
}

class _TasbihPageState extends State<TasbihPage>
    with SingleTickerProviderStateMixin {
  int counter = 0;
  int total = 0;
  String currentInvocation = 'سُبْحَانَ ٱللَّٰه';
  final List<String> invocations = [
    'سُبْحَانَ ٱللَّٰه',
    'ٱلْـحَمْـدُ للهِ',
    'اللّٰهُ أَكْبَر',
    'لَا إِلَٰهَ إِلَّا ٱللَّٰهُ',
    'أَسْتَغْفِرُ ٱللّٰه'
  ];
  final TextEditingController customController = TextEditingController();
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    animation =
        Tween<double>(begin: 1.0, end: 1.1).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    customController.dispose();
    super.dispose();
  }

  void incrementCounter() {
    animationController.forward().then((_) {
      animationController.reverse();
    });
    setState(() {
      counter++;
      total++;
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  void updateInvocation(String newInvocation) {
    setState(() {
      currentInvocation = newInvocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Tasbih', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 16),
            // Dropdown + Champ texte
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: invocations.contains(currentInvocation)
                        ? currentInvocation
                        : null,
                    hint: Text("Sélectionner une invocation"),
                    onChanged: (value) {
                      if (value != null) {
                        updateInvocation(value);
                        customController.clear();
                      }
                    },
                    items: invocations.map((invocation) {
                      return DropdownMenuItem<String>(
                        value: invocation,
                        child: Text(invocation, textAlign: TextAlign.center),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            TextField(
              controller: customController,
              decoration: InputDecoration(
                hintText: 'Entrez votre propre invocation',
              ),
              textAlign: TextAlign.center,
              onChanged: (value) {
                if (value.trim().isNotEmpty) {
                  updateInvocation(value.trim());
                } else {
                  updateInvocation(invocations.first);
                }
              },
            ),
            SizedBox(height: 20),
            // Invocation affichée
            Text(
              currentInvocation,
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Cercle avec boutons et compteur
            Stack(
              alignment: Alignment.center,
              children: [
                ScaleTransition(
                  scale: animation,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  child: IconButton(
                    icon: Icon(Icons.refresh, color: Colors.white),
                    onPressed: resetCounter,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  child: IconButton(
                    icon: Icon(Icons.touch_app, color: Colors.white),
                    onPressed: incrementCounter,
                  ),
                ),
                Text(
                  '$counter',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Bas
            Text(
              'غالباً ما تشعرنا مشاكل الحياة أننا في عاصفة من التحديات.',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
