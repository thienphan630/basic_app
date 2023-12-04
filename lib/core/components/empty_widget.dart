import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String? message;
  final IconData? iconData;
  const EmptyWidget({Key? key, @required this.message, this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconData != null
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Icon(
                      iconData,
                      color: Colors.grey,
                      size: 64.0,
                    ),
                  )
                : Container(),
            Text(
              message ?? '',
              style: TextStyle(
                fontSize: iconData != null ? 18.0 : 14.0,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
