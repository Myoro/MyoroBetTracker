import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:myoro_bet_tracker/blocs/available_income_cubit.dart';
import 'package:myoro_bet_tracker/blocs/bets_bloc/bets_bloc.dart';
import 'package:myoro_bet_tracker/widgets/inputs/basic_text_field_form.dart';
import 'package:myoro_bet_tracker/widgets/inputs/dropdown_and_text_field_form.dart';
import 'package:myoro_bet_tracker/widgets/modals/bet_form_modal.dart';
import 'package:myoro_bet_tracker/widgets/screens/home_screen.dart';

import '../test/base_test_widget.dart';
import '../test/find_by_predicate_helper.dart';

void main() {
  testWidgets('Bet Workflow Integration Test', (tester) async {
    await tester.pumpWidget(
      BaseTestWidget(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AvailableIncomeCubit(0)),
            BlocProvider(create: (context) => BetsBloc([])),
          ],
          child: const HomeScreen(),
        )
      ),
    );

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Filling form
    await tester.enterText(FindByPredicateHelper.basicTextFieldFormByPredicate('Bet Name'), 'Test Bet Name');
    await tester.enterText(FindByPredicateHelper.basicTextFieldFormByPredicate('\$ Placed'), '123.45');
    await tester.enterText(FindByPredicateHelper.dropdownAndTextFieldFormByPredicate('Gained/Lost'), '678.90');
    await tester.enterText(FindByPredicateHelper.basicTextFieldFormByPredicate('Date Placed'), DateFormat('dd/MM/yyyy').format(DateTime.now()));
    await tester.tap(FindByPredicateHelper.dropdownButtonByPredicate('Soccer'));
    await tester.pump();
    await tester.tap(FindByPredicateHelper.dropdownMenuItemByPredicate('Basketball'));
    await tester.pump();
    await tester.tap(FindByPredicateHelper.textHoverButtonByPredicate('Create'));
    await tester.pump();

    expect(find.byType(BetFormModal), findsNothing);
  });
}