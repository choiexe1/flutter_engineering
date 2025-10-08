import 'package:flutter/material.dart';

class LifecycleWidget extends StatefulWidget {
  const LifecycleWidget({super.key});
  @override
  State<StatefulWidget> createState() => _LifecycleWidgetState();
}

class _LifecycleWidgetState extends State<LifecycleWidget> {
  int _counter = 0;

  _LifecycleWidgetState() {
    print('생성자, 마운트됨 = $mounted');
  }

  @override
  void initState() {
    super.initState();
    print('initState, 마운트됨 = $mounted');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies, 마운트됨 = $mounted');
  }

  @override
  Widget build(BuildContext context) {
    print('빌드 메서드 실행');
    return Column(
      children: [
        Text('카운터 $_counter'),
        ElevatedButton(
          child: const Text('증가'),
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
        ),
      ],
    );
  }

  @override
  void didUpdateWidget(covariant LifecycleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget, 마운트됨 = $mounted');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivate, 마운트됨 = $mounted');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose, 마운트됨 = $mounted');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble, 마운트됨 = $mounted');
  }
}
