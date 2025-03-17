

import 'package:flutter/material.dart';

class ListDialog extends StatefulWidget {
  const ListDialog({super.key});

  @override
  _ListDialogState createState() => _ListDialogState();
}

class _ListDialogState extends State<ListDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3x3 Grid Buttons')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 cột
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
          ),
          children: [
            ElevatedButton(
              onPressed: () => CustomDialog.show(context),
              child: const Text('Dialog'),
            ),
            ElevatedButton(
              onPressed: () => BottomSheetDialog.show(context),
              child: const Text('BottomSheetDialog'),
            ),
            ElevatedButton(
              onPressed: () => AlertDialogExample.show(context),
              child: const Text('AlertDialog'),
            ),
            ElevatedButton(
              onPressed: () => SimpleDialogExample.show(context),
              child: const Text('SimpleDialog'),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thông báo'),
          content: const Text('Xin chào'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Đóng'),
            ),
          ],
        );
      },
    );
  }
}

class BottomSheetDialog {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Do you want to logout?',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'You can login with the same mobile number later.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.grey),
                    ),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Xử lý khi logout
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class AlertDialogExample {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thông báo'),
          content: const Text('Bạn có chắc chắn muốn tiếp tục không?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () {
                // Xử lý khi bấm OK
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class SimpleDialogExample {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Chọn một mục'),
          children: [
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 'Option 1'),
              child: const Text('Option 1'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 'Option 2'),
              child: const Text('Option 2'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 'Option 3'),
              child: const Text('Option 3'),
            ),
          ],
        );
      },
    );
  }
}
