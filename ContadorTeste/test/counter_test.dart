import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Deve incrementar o contador', (WidgetTester tester) async {

    // Carrega a tela
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    // Verifica valor inicial
    expect(find.text('0'), findsOneWidget);

    // Clica no botão +
    await tester.tap(find.byIcon(Icons.add));

    // Atualiza a tela
    await tester.pump();

    // Verifica se incrementou
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Deve decrementar o contador', (WidgetTester tester) async {

    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    // Incrementa primeiro
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);

    // Decrementa
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('Deve resetar o contador', (WidgetTester tester) async {

    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    // Soma duas vezes
    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('2'), findsOneWidget);

    // Reseta
    await tester.tap(find.byIcon(Icons.restore));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
  });
}