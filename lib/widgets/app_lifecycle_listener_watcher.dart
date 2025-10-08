import 'package:flutter/material.dart';

class AppLifecycleListenerWatcher extends StatefulWidget {
  const AppLifecycleListenerWatcher({super.key});

  @override
  State<StatefulWidget> createState() => _AppLifecycleListenerWatcherState();
}

class _AppLifecycleListenerWatcherState
    extends State<AppLifecycleListenerWatcher> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onRestart: () {
        print('App restarted');
      },
      onShow: () {
        print('App shown');
      },
      onHide: () {
        print('App hidden');
      },
      onResume: () {
        print('App resumed');
      },
      onPause: () {
        print('App paused');
      },
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
