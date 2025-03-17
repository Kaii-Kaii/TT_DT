import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: ListviewDemo()));
}

class ListviewDemo extends StatefulWidget {
  const ListviewDemo({super.key});

  @override
  _ListViewDemo createState() => _ListViewDemo();
}

class _ListViewDemo extends State<ListviewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('4 ListView Examples')),
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
                  MaterialPageRoute(builder: (context) => const ListViewPage()),
                );
              },
              child: const Text('ListView'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListViewBuilderPage(),
                  ),
                );
              },
              child: const Text('ListView.builder'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListViewSeparatedPage(),
                  ),
                );
              },
              child: const Text('ListView.separated'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListViewCustomPage(),
                  ),
                );
              },
              child: const Text('ListView.custom'),
            ),
          ],
        ),
      ),
    );
  }
}

/// **1. ListView cơ bản**
class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView')),
      body: ListView(
        children: const [
          ColoredListTile(
            color: Colors.lightBlueAccent,
            leading: Icon(Icons.star),
            title: Text('Item 1'),
          ),
          ColoredListTile(
            color: Colors.lightGreenAccent,
            leading: Icon(Icons.star),
            title: Text('Item 2'),
          ),
          ColoredListTile(
            color: Colors.lightBlueAccent,
            leading: Icon(Icons.star),
            title: Text('Item 3'),
          ),
          ColoredListTile(
            color: Colors.lightGreenAccent,
            leading: Icon(Icons.star),
            title: Text('Item 4'),
          ),
        ],
      ),
    );
  }
}

/// **2. ListView.builder**
class ListViewBuilderPage extends StatelessWidget {
  const ListViewBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView.builder')),
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) {
          return ColoredListTile(
            color:
                index % 2 == 0
                    ? Colors.lightBlueAccent
                    : Colors.lightGreenAccent,
            leading: const Icon(Icons.star),
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
}

/// **3. ListView.separated**
class ListViewSeparatedPage extends StatelessWidget {
  const ListViewSeparatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView.separated')),
      body: ListView.separated(
        itemCount: 20,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return ColoredListTile(
            color:
                index % 2 == 0
                    ? Colors.lightBlueAccent
                    : Colors.lightGreenAccent,
            leading: const Icon(Icons.label),
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
}

/// **4. ListView.custom**
class ListViewCustomPage extends StatelessWidget {
  const ListViewCustomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView.custom')),
      body: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate((context, index) {
          return ColoredListTile(
            color:
                index % 2 == 0
                    ? Colors.lightBlueAccent
                    : Colors.lightGreenAccent,
            leading: const Icon(Icons.book),
            title: Text('Custom Item $index'),
          );
        }, childCount: 30),
      ),
    );
  }
}

// Widget tùy chỉnh để thêm màu nền cho ListTile
class ColoredListTile extends StatelessWidget {
  final Color color;
  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;

  const ColoredListTile({
    super.key,
    required this.color,
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
      ),
    );
  }
}
