import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jigsaw/presentation/jigsaw/views/jigsaw_puzzle_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const JigsawPuzzlePage(),
    );
  }
}
