import 'package:flutter/material.dart';
import 'detail_screen.dart';


class MyGridView extends StatefulWidget {
  const MyGridView({super.key});

  @override
  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  List<String> items = List.generate(25, (index) => "Ô ${index + 1}");

  void _addItem() {
    setState(() {
      items.add("Ô ${items.length + 1}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView 5x5"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, // 5 cột
            crossAxisSpacing: 5, // Khoảng cách giữa các cột
            mainAxisSpacing: 5, // Khoảng cách giữa các hàng
          ),
          itemCount: items.length, // Số lượng ô sẽ thay đổi khi thêm
          itemBuilder: (context, index) {
            return GridItem(
              text: items[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      itemText: items[index],
                      isFromGrid: true,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }
}


class GridItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const GridItem({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}