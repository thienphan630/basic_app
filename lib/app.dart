import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text('Hello World!'),
            ),
            ElevatedButton(
              onPressed: () {
                ShowToastMessage._()
                    .showToast(message: 'Hello from the other side');
              },
              child: const Text('Show toast'),
            )
          ],
        ),
      ),
    );
  }
}

class ShowToastMessage {
  ShowToastMessage._();
  MethodChannel channel = const MethodChannel('flutter.showToast');
  void showToast({required String message}) {
    channel.invokeMethod('show_toast', {'message': message, 'showTime': 10});
  }
}
