# App Contador Flutter

Projeto simples em Flutter para praticar:

- `StatefulWidget`
- `setState`
- Widget Test
- Testes automatizados no Flutter

---

# Dependência de teste

Adicione a dependência de teste:

```bash
flutter pub add dev:test
```

Depois execute:

```bash
flutter pub get
```

---

# Estrutura do projeto

```bash
lib/
 └── main.dart

test/
 └── home_page_test.dart
```

---

# Home Page

Arquivo:

```bash
lib/main.dart
```

---

# Código da HomePage

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;

  void add() {
    setState(() {
      contador++;
    });
  }

  void minus() {
    setState(() {
      contador--;
    });
  }

  void reset() {
    setState(() {
      contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(contador.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: add,
                child: const Icon(Icons.add),
              ),

              TextButton(
                onPressed: minus,
                child: const Icon(Icons.remove),
              ),

              TextButton(
                onPressed: reset,
                child: const Icon(Icons.restore),
              )
            ],
          )
        ],
      ),
    );
  }
}
```

---

# Explicação da HomePage

## Variável contador

```dart
int contador = 0;
```

Essa variável guarda o valor atual do contador.

---

## Método add()

```dart
void add() {
  setState(() {
    contador++;
  });
}
```

Responsável por incrementar o valor do contador.

O `setState()` atualiza a interface automaticamente.

---

## Método minus()

```dart
void minus() {
  setState(() {
    contador--;
  });
}
```

Responsável por decrementar o contador.

---

## Método reset()

```dart
void reset() {
  setState(() {
    contador = 0;
  });
}
```

Responsável por resetar o contador para zero.

---

# Interface da tela

## Exibir contador

```dart
Text(contador.toString())
```

Mostra o valor atual do contador na tela.

---

# Botões

## Botão adicionar

```dart
TextButton(
  onPressed: add,
  child: const Icon(Icons.add),
)
```

---

## Botão remover

```dart
TextButton(
  onPressed: minus,
  child: const Icon(Icons.remove),
)
```

---

## Botão resetar

```dart
TextButton(
  onPressed: reset,
  child: const Icon(Icons.restore),
)
```

---

# Testes Flutter

Arquivo:

```bash
test/home_page_test.dart
```

---

# Código do teste

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:seu_projeto/main.dart';

void main() {

  testWidgets('Deve incrementar o contador',
      (WidgetTester tester) async {

    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));

    await tester.pump();

    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Deve decrementar o contador',
      (WidgetTester tester) async {

    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('Deve resetar o contador',
      (WidgetTester tester) async {

    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    await tester.tap(find.byIcon(Icons.add));
    await tester.tap(find.byIcon(Icons.add));

    await tester.pump();

    expect(find.text('2'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.restore));

    await tester.pump();

    expect(find.text('0'), findsOneWidget);
  });
}
```

---

# Explicação dos testes

## pumpWidget()

```dart
await tester.pumpWidget(
  const MaterialApp(
    home: HomePage(),
  ),
);
```

Renderiza a tela dentro do ambiente de teste.

---

## expect()

```dart
expect(find.text('0'), findsOneWidget);
```

Verifica se determinado valor aparece na tela.

---

## tap()

```dart
await tester.tap(find.byIcon(Icons.add));
```

Simula um clique do usuário.

---

## pump()

```dart
await tester.pump();
```

Atualiza a interface após a ação.

---

# Executando os testes

```bash
flutter test
```

---

# Resultado esperado

```bash
00:02 +3: All tests passed!
```

---

# Tecnologias utilizadas

- Flutter
- Dart
- flutter_test
- test