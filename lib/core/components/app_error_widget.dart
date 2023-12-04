import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  final String error;
  final Function? onRetryTapped;

  const AppErrorWidget({Key? key, required this.error, this.onRetryTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                error,
                style: TextStyle(
                  color: Colors.red[400],
                  fontSize: 16
                ),
              ),
            ),
            onRetryTapped != null ? InkWell(
              onTap: () {
                onRetryTapped!();
              },
              // color: Colors.white,
              // textColor: Theme.of(context).primaryColor,
              // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
              child: const Text("Tải lại"),
            ) : Container(),
          ],
        ),
      ),
    );
  }
}
