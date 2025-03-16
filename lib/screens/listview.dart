import 'package:flutter/material.dart';
import 'detail_screen.dart';

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  List<String> items = ["Item 1", "Item 2", "Item 3"];
  List<String> filteredItems = [];
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = items;
  }

  void _addItem(String text) {
    setState(() {
      items.add(text);
      _sortItemsAZ();
    });
  }

  void _sortItemsAZ() {
    setState(() {
      items.sort();
      filteredItems = items;
    });
  }

  void _sortItemsZA() {
    setState(() {
      items.sort((a, b) => b.compareTo(a));
      filteredItems = items;
    });
  }

  void _filterItems(String query) {
    setState(() {
      filteredItems =
          items
              .where((item) => item.toLowerCase().contains(query.toLowerCase()))
              .toList();
    });
  }

  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add New Item"),
          content: TextField(
            controller: _textController,
            decoration: const InputDecoration(hintText: "Enter item text"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _addItem(_textController.text);
                _textController.clear();
                Navigator.of(context).pop();
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView Demo"),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: const Icon(Icons.sort_by_alpha),
            onPressed: _sortItemsAZ,
          ),
          IconButton(icon: const Icon(Icons.sort), onPressed: _sortItemsZA),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: _filterItems,
            ),
          ),
        ),
      ),
      body: ListView(
        children:
            filteredItems
                .map(
                  (text) => MyListItem(
                    text: text,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DetailScreen(
                                itemText: text,
                                isFromGrid: false,
                              ),
                        ),
                      );
                    },
                  ),
                )
                .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddItemDialog,
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyListItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const MyListItem({super.key, required this.text, required this.onTap});

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
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
