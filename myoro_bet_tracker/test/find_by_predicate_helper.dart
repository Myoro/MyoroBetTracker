import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myoro_bet_tracker/widgets/buttons/text_hover_button.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_text_field_form.dart';
import 'package:myoro_bet_tracker/widgets/inputs/dropdown_and_text_field_form.dart';

// TODO: Write all functions
/// findByPredicate functions for all widgets of the application
class FindByPredicateHelper {
  static Finder textHoverButtonByPredicate(String text) => find.byWidgetPredicate(
    (widget) => (
      widget is TextHoverButton
      &&
      widget.text == text
    ),
  );

  static Finder basicTextFieldFormByPredicate(String title) => find.byWidgetPredicate(
    (widget) => (
      widget is BasicTextFieldForm
      &&
      widget.title == title
    ),
  );

  static Finder dropdownButtonByPredicate(String value) => find.byWidgetPredicate(
    (widget) => (
      widget is DropdownButton
      &&
      widget.value == value
    ),
  );

  static Finder dropdownMenuItemByPredicate(String value) => find.byWidgetPredicate(
    (widget) => (
      widget is DropdownMenuItem<String>
      &&
      widget.value == value
    ),
  );

  static Finder dropdownAndTextFieldFormByPredicate(String title) => find.byWidgetPredicate(
    (widget) => (
      widget is DropdownAndTextFieldForm
      &&
      widget.title == title
    ),
  );
}