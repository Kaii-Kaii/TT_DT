import 'package:flutter/material.dart';

class MyColum extends StatelessWidget {
  const MyColum({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Added MaterialApp
      home: Scaffold( // Không cần bọc trong MaterialApp
        appBar: AppBar(title: const Text('Column Layout')),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(color: Colors.red, height: 100, width: 100),
              const SizedBox(height: 20),
              Container(color: Colors.green, height: 100, width: 100),
              const SizedBox(height: 20),
              Container(color: Colors.blue, height: 100, width: 100),
            ],
          ),
        ),
      ),
    );
  }
}
