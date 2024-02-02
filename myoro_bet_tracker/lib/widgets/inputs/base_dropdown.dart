import 'package:flutter/material.dart';

class BaseDropdown extends StatefulWidget {
  final List<String> items;
  final Function(String) onChanged;
  final double? width;

  const BaseDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.width,
  });

  @override
  State<BaseDropdown> createState() => _BaseDropdownState();
}

class _BaseDropdownState extends State<BaseDropdown> {
  late final ValueNotifier<String> _value;

  @override
  void initState() {
    super.initState();
    assert(widget.items.isNotEmpty);
    _value = ValueNotifier<String>(widget.items[0]);
  }

  @override
  void dispose() {
    _value.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return ValueListenableBuilder(
      valueListenable: _value,
      builder: (context, value, child) => SizedBox(
        width: widget.width,
        child: DropdownButton(
            value: value,
            isExpanded: widget.width != null,
            underline: Container(
              width: double.infinity,
              height: 2,
              color: theme.colorScheme.onPrimary,
            ),
            items: widget.items
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              _value.value = value!;
              widget.onChanged(value);
            }),
      ),
    );
  }
}
