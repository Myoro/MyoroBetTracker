import 'package:flutter/material.dart';

class HeaderWithCheckbox extends StatefulWidget {
  final String title;
  final Function(bool) onChanged;

  const HeaderWithCheckbox({
    super.key,
    required this.title,
    required this.onChanged
  });

  @override
  State<HeaderWithCheckbox> createState() => _HeaderWithCheckboxState();
}

class _HeaderWithCheckboxState extends State<HeaderWithCheckbox> {
  final ValueNotifier<bool> _checked = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: _checked,
    builder: (context, checked, child) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(MediaQuery.of(context).size.width > 600) ...[
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleLarge
            ),
            SizedBox(width: MediaQuery.of(context).size.width - 550)
          ],
          Text(
            'Show ${widget.title}',
            style: Theme.of(context).textTheme.titleSmall
          ),
          const SizedBox(width: 5),
          Checkbox(
            onChanged: (value) {
              _checked.value = value!;
              widget.onChanged(_checked.value);
            },
            value: checked
          )
        ],
      ),
    ),
  );
}