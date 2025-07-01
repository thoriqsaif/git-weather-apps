import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          //  Text('Hari ini hari sabtu'));
          // Container(
          //   width: 100,
          //   height: 100,
          //   padding: EdgeInsets.all(10),
          //   margin: EdgeInsets.all(10),
          //   alignment: Alignment.center,
          //   decoration: BoxDecoration(
          //     color: Colors.blue,
          //     borderRadius: BorderRadius.circular(10),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.black26,
          //         blurRadius: 4,
          //         offset: Offset(2, 2),
          //       ),
          //     ],
          //   ),
          //   child: Text('Hello I\'m Child Of Container'),
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Icon(Icons.arrow_back),
          //     Text('Hari ini hari sabtu'),
          //     Icon(Icons.menu),
          //   ],
          // ),
          Column(
            children: [
              Text(
                'Judul Apa Judul',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 61, 25, 4),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(5, 5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      // Handle the saved value
                    },
                  ),
                ],
              ),
            ],
          ),
    );
  }
}
