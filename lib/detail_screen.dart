import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String? message;
  const DetailScreen({this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Text('Ini Detail Data : $message'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Home'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
