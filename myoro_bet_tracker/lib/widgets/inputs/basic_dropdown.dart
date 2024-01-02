import 'package:flutter/material.dart';

class BasicDropdown extends StatefulWidget {
  final List<String> items;
  final Function onChanged;
  final double width;
  final double height;

  const BasicDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.height = 40,
    this.width = 100,
  });

  @override
  State<BasicDropdown> createState() => _BasicDropdownState();
}

class _BasicDropdownState extends State<BasicDropdown> {
  late final ValueNotifier<String> _dropdownValue;

  @override
  void initState() {
    super.initState();
    _dropdownValue = ValueNotifier<String>(widget.items[0]);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ValueListenableBuilder(
      valueListenable: _dropdownValue,
      builder: (context, dropdownValue, child) => Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: theme.colorScheme.onPrimary,
            width: 2
          )
        ),
        child: DropdownButton(
          value: dropdownValue,
          isExpanded: true,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          underline: Container(), // Removes the default underline
          items: List.generate(widget.items.length, (index) => DropdownMenuItem<String>(
            value: widget.items[index],
            child: Text(
              widget.items[index],
              style: theme.textTheme.bodyMedium
            )
          )),
          onChanged: (value) {
            widget.onChanged(value);
            _dropdownValue.value = value!;
          }
        ),
      ),
    );
  }
}