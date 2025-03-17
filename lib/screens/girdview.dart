import 'package:flutter/material.dart';

class GridViewDemo extends StatefulWidget {
  const GridViewDemo({super.key});

  @override
  _GridViewDemo createState() => _GridViewDemo();
}

class _GridViewDemo extends State<GridViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3 GridView Examples')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Hiển thị 2 cột
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GridViewCountPage()),
                );
              },
              child: const Text('GridView.count'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GridViewBuilderPage(),
                  ),
                );
              },
              child: const Text('GridView.builder'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GridViewExtentPage(),
                  ),
                );
              },
              child: const Text('GridView.extent'),
            ),
          ],
        ),
      ),
    );
  }
}

/// **1. GridView.count**
class GridViewCountPage extends StatelessWidget {
  const GridViewCountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView.count')),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        children: List.generate(10, (index) {
          return ColoredGridTile(title: 'Item $index');
        }),
      ),
    );
  }
}

/// **2. GridView.builder**
class GridViewBuilderPage extends StatelessWidget {
  const GridViewBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView.builder')),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return ColoredGridTile(title: 'Item $index');
        },
      ),
    );
  }
}

/// **3. GridView.extent**
class GridViewExtentPage extends StatelessWidget {
  const GridViewExtentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView.extent')),
      body: GridView.extent(
        maxCrossAxisExtent: 150,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        children: List.generate(15, (index) {
          return ColoredGridTile(title: 'Item $index');
        }),
      ),
    );
  }
}

// Widget tùy chỉnh để thêm màu nền cho GridTile
class ColoredGridTile extends StatelessWidget {
  final String title;

  const ColoredGridTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
