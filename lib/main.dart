import 'package:flutter/material.dart';
import 'package:flutter_engineering/widgets/labeled_divider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(children: [LabeledDivider(label: 'Hello')]),
        ),
      ),
    );
  }
}
