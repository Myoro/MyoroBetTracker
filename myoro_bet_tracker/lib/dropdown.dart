import "package:flutter/material.dart";

class Dropdown extends StatefulWidget {
  final Function onChanged;

  const Dropdown({
    super.key,
    required this.onChanged
  });

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String value = "Won";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButton<String>(
        isExpanded: true,
        value: value,
        onChanged: (value) {
          setState(() => this.value = value!); 
          widget.onChanged(value);
        },
        items: [ "Won", "Lost" ].map((button) => DropdownMenuItem<String>(
          value: button,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              button,
              style: Theme.of(context).textTheme.bodyMedium
            )
          )
        )).toList()
      ),
    );
  }
}