import 'package:flutter/material.dart';
import 'package:flutter_engineering/widgets/app_lifecycle_listener_watcher.dart';

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
          child: Column(children: [AppLifecycleListenerWatcher()]),
        ),
      ),
    );
  }
}
