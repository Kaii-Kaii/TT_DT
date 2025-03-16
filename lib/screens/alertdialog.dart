import 'package:flutter/material.dart';

class AlertDialogButton extends StatelessWidget {
  const AlertDialogButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Xác nhận"),
              content: const Text("Bạn có chắc chắn muốn xóa không?"),
              actions: [
                // Nút "Không" - Hiển thị Snackbar
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Đóng dialog
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Bạn đã xóa thành công"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text("Không"),
                ),

                // Nút "Có" - Chuyển sang trang mới
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Đóng dialog
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewScreen()),
                    );
                  },
                  child: const Text("Có"),
                ),
              ],
            );
          },
        );
      },
      child: const Text('AlertDialog Button'),
    );
  }
}

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Màn hình mới")),
      body: const Center(
        child: Text("Bạn đã chuyển sang trang mới!", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
