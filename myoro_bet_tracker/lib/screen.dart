import "package:flutter/material.dart";
import "package:myoro_bet_tracker/top_bar.dart";
import "package:myoro_bet_tracker/body.dart";

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TopBar(),
      body: Body()
    );
  }
}