import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'burgstadt/burgstadt_seite.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  runApp(const BurgstadtApp());
}

/// App-Hülle: „Burgstadt Schartenfels“ im Vollbild, ohne weitere Bildschirme.
class BurgstadtApp extends StatelessWidget {
  const BurgstadtApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burgstadt Schartenfels',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, scaffoldBackgroundColor: Colors.black),
      home: const BurgstadtSeite(),
    );
  }
}
