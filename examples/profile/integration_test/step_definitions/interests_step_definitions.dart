import 'package:flutter/material.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:surf_flutter_test/surf_flutter_test.dart';

import '../test_screen_library.dart';

final List<String> interests = <String>[
  'Photo',
  'Art',
  'Home decor',
  'Food and drink',
];

final interestsStepDefinitions = [
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я указываю интересы$'),
    (context, tester) async {
      await tester.pumpUntilVisible(interestsTestScreen.trait);
      for (var i = 0; i < interests.length; i++) {
        await tester.implicitTap(find.text(interests[i]));
      }
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я перехожу далее на экран информации о себе$'),
    (context, tester) async {
      await tester.pumpUntilVisible(interestsTestScreen.trait);
      await tester.implicitTap(generalTestScreen.nextBtn);
      await tester.pumpUntilVisible(aboutMeTestScreen.trait);
    },
  ),
  testerThen<FlutterWidgetTesterWorld>(
    RegExp(r'Я вижу указанные интересы$'),
    (context, tester) async {
      await tester.pumpUntilVisible(interestsTestScreen.trait);

      for (var i = 0; i < interests.length; i++) {
        Finder checkBoxText = find.text(interests[i]);
        expect(checkBoxText, findsOneWidget);

        Finder row = find.widgetWithText(Row, interests[i]);
        expect(row, findsOneWidget);

        var checkbox = find
            .descendant(of: row, matching: find.byType(Checkbox))
            .evaluate()
            .single
            .widget as Checkbox;

        expect(checkbox.value, true);
      }
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я перехожу далее для проверки информации о себе$'),
    (context, tester) async {
      await tester.pumpUntilVisible(interestsTestScreen.trait);
      await tester.implicitTap(generalTestScreen.nextBtn);
      await tester.pumpUntilVisible(aboutMeTestScreen.trait);
    },
  ),
  testerWhen<FlutterWidgetTesterWorld>(
    RegExp(r'Я нажимаю кнопку "Назад" и перехожу на экран выбора города$'),
    (context, tester) async {
      await tester.pumpUntilVisible(interestsTestScreen.trait);
      await tester.implicitTap(generalTestScreen.backBtn);
      await tester.pumpUntilVisible(residenceTestScreen.trait);
    },
  ),
];
