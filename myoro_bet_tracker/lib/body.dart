import "package:flutter/material.dart";
import "package:myoro_bet_tracker/hover_button.dart";
import "package:myoro_bet_tracker/input_field.dart";

class Body extends StatelessWidget {
  const Body({ super.key });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Center(
      child: SizedBox(
        width: 220,
        child: ListView(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputField(width: 104, placeholder: "\$ Placed"),
                SizedBox(width: 10),
                InputField(width: 104, placeholder: "\$ Won")
              ]
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                HoverButton(
                  buttonText: "Add Bet",
                  icon: Icons.add,
                  onTap: () {} // TODO
                ),
                const SizedBox(height: 5),
                HoverButton(
                  buttonText: "Export Data",
                  icon: Icons.save,
                  onTap: () {} // TODO
                )
              ]
            )
          ]
        ),
      ),
    );
  }
}