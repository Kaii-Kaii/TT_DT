import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String itemText;
  final bool isFromGrid;

  const DetailScreen({super.key, required this.itemText, required this.isFromGrid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chi tiết Item")),
      body: Center(
        child: Text(
          "Bạn đã chọn: $itemText\nTừ: ${isFromGrid ? 'GridView' : 'ListView'}",
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
