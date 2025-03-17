import 'package:flutter/material.dart';
import 'package:baocao/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ứng dụng demo Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(), // Tách thành một widget riêng
    );
  }
}

// Tạo một widget HomePage riêng biệt
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Widget trong Flutter",
          style: TextStyle(
            color: Color.fromARGB(255, 201, 229, 16),
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.blue[900],
        leading: IconButton(icon: const Icon(Icons.home), onPressed: () {}),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // chuyển hướng sang trang mới
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListDialog()),
                );
              },
              child: const Text("Dialog Demo"),
            ),
            const SizedBox(height: 20),
            AlertDialogButton(),
            const SizedBox(height: 20), // Thêm khoảng cách
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewScreen()),
                );
              },
              child: const Text("Chuyển đến trang mới"),
            ),
            const SizedBox(height: 20), // Thêm khoảng cách
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListviewDemo()),
                );
              },
              child: const Text("ListView Demo"),
            ),
            const SizedBox(height: 20), // Thêm khoảng cách
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyGridView()),
                );
              },
              child: const Text("GridView Demo"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: (BottomAppBar(
        color: Colors.blue[900],
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Quay lại trang chính"),
        ),
      )),
    );
  }
}

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trang mới"),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Quay lại trang chính"),
        ),
      ),
    );
  }
}
