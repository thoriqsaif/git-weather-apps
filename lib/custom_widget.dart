import 'package:flutter/material.dart';
import 'package:latihan_packages/my_custom_button.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyCustomButton(
              label: 'Click Me',
              onTap: () {
                // Handle button tap
              },
              color: Colors.blue,
            ),
            Row(children: [
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
