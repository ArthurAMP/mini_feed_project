import 'package:flutter/material.dart';
import 'package:mini_feed_project/views/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MiniFeed",
      home: Scaffold(
        appBar: AppBar(title: const Center(child: Text("MiniFeed"))),
        body: const HomePage(),
      ),
    );
  }
}
