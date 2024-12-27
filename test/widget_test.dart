// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Ana uygulama dosyanızın yolu.

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Uygulamayı oluştur ve bir frame tetikle.
    await tester.pumpWidget(MyApp());

    // Sayacın başlangıç değerini doğrula (0).
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // '+' simgesine tıkla ve bir frame tetikle.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Sayacın arttığını doğrula (1).
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

// MyApp sınıfı (test edilen ana uygulama).
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(), // Test edeceğimiz sayfa burada.
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // Sayacın başlangıç değeri.

  void _incrementCounter() {
    setState(() {
      _counter++; // Sayaç değerini artır.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Tracker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}