import 'package:flutter/material.dart';

class AdminDishesPage extends StatefulWidget {
  const AdminDishesPage({super.key});
  static const routeName = 'admin/dishes';

  @override
  State<AdminDishesPage> createState() => _AdminDishesPage();
}

class _AdminDishesPage extends State<AdminDishesPage> {
  final isLoading = true;

  Future getData() async {}

  void onAdd() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dishes')),
      body: RefreshIndicator(
        onRefresh: getData,
        child: Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAdd,
        child: const Icon(Icons.add),
      ),
    );
  }
}
