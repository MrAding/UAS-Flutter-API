import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Mendefinisikan kelas MyApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aplikasi Saya'),
        ),
        body: const Center(
          child: Text('Halo, Dunia!'),
        ),
      ),
    );
  }
}

void main() {
  testWidgets('Pengujian penambahan counter', (WidgetTester tester) async {
    // Bangun aplikasi kita dan lakukan pembaruan frame.
    await tester.pumpWidget(MyApp());

    // Verifikasi bahwa counter kita dimulai dari 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Ketuk ikon '+' dan lakukan pembaruan frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verifikasi bahwa counter kita telah bertambah.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
