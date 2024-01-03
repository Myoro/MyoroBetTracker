import 'package:flutter/material.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_dropdown.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_input.dart';

class InputForm extends StatelessWidget {
  final String title;
  final String? hintText;
  final String? noInputText;
  final List<String> dropdownItems;
  final TextAlign textAlignment;
  final TextEditingController? controller;
  final Function? dropdownOnChanged;
  final bool expanded;
  final bool titleExpanded;
  final bool dropdownTitle;
  final bool inputExpanded;
  final bool showInput;
  final bool numberFormatters;

  const InputForm({
    super.key,
    required this.title,
    this.hintText,
    this.expanded = false,
    this.titleExpanded = false,
    this.textAlignment = TextAlign.right,
    this.inputExpanded = false,
    this.controller,
    this.dropdownTitle = false,
    this.dropdownItems = const [ 'Missing items' ],
    this.dropdownOnChanged,
    this.showInput = true,
    this.noInputText,
    this.numberFormatters = true
  });

  @override
  Widget build(BuildContext context) => !expanded
    ? _widget(context)
    : Expanded(child: _widget(context));

  Widget _widget(BuildContext context) => Row(
    children: [
      !titleExpanded
        ?
        _title(context)
        :
        Expanded(
          child: _title(context)
        ),
      const SizedBox(width: 10),
      !inputExpanded
        ?
        _input(context)
        :
        Expanded(child: _input(context))
    ]
  );

  Widget _title(BuildContext context) => !dropdownTitle
    ?
    Text(
      '$title:',
      style: Theme.of(context).textTheme.bodyMedium,
      textAlign: textAlignment
    )
    :
    BasicDropdown(
      items: dropdownItems,
      onChanged: dropdownOnChanged != null
        ?
        (value) => dropdownOnChanged!(value)
        :
        (value) => debugPrint('Missing implementation')
    );

  Widget _input(BuildContext context) => showInput
    ?
    BasicInput(hintText: hintText, controller: controller, numberFormatters: numberFormatters)
    :
    Text(noInputText ?? '', style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center);
}