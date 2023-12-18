import "package:flutter/material.dart";
import "package:myoro_bet_tracker/screen.dart";

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Bet Tracker",
      // theme: theme,
      home: Screen()
    );
  }
}