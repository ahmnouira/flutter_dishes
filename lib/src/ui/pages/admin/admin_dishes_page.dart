import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/dishes.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';
import 'package:flutter_dishes/src/ui/dialogs/dish_dialog.dart';
import 'package:flutter_dishes/src/ui/widgets/dish_list_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/loading_widget.dart';

class AdminDishesPage extends StatefulWidget {
  const AdminDishesPage({super.key});
  static const routeName = 'admin/dishes';

  @override
  State<AdminDishesPage> createState() => _AdminDishesPage();
}

class _AdminDishesPage extends State<AdminDishesPage> {
  bool _isLoading = true;

  List<Dish> _list = [];

  void _showDialog(DialogAction dialogAction, Dish? item) {
    final dialog = DishDialog();
    showDialog(
      context: context,
      builder: (context) => dialog.buildDialog(dialogAction, item),
    );
  }

  Future getData() async {
    setState(() {
      _list = dishes;
      _isLoading = false;
    });
  }

  void onAdd() {
    _showDialog(DialogAction.add, null);
  }

  void onEdit(Dish item) {
    _showDialog(DialogAction.edit, item);
  }

  void onDelete(Dish item) {
    setState(() {
      _list.removeWhere((element) => element.id == item.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dishes')),
      body: _isLoading
          ? const LoadingWidget()
          : RefreshIndicator(
              onRefresh: getData,
              child: DishListWidget(
                list: _list,
                onDelete: onDelete,
                onEdit: onEdit,
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAdd,
        child: const Icon(Icons.add),
      ),
    );
  }
}
