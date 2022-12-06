import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';
import 'package:flutter_dishes/src/services/dish_service.dart';
import 'package:flutter_dishes/src/ui/dialogs/dish_dialog.dart';
import 'package:flutter_dishes/src/ui/widgets/dish_list_view_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/page_widget.dart';

class AdminDishesPage extends StatefulWidget {
  const AdminDishesPage({super.key});
  static const routeName = 'admin/dishes';

  @override
  State<AdminDishesPage> createState() => _AdminDishesPage();
}

class _AdminDishesPage extends State<AdminDishesPage> {
  final DishService dishService = DishService();

  late final Stream<QuerySnapshot<Object?>>? _stream;

  final pageWidget = PageWidget();

  Future<void> getData() async {
    print('getData');
    setState(() {
      _stream = dishService.getAll();
    });
  }

  void _showDialog(DialogAction dialogAction, Dish? item) {
    final dialog = DishDialog();
    showDialog(
      context: context,
      builder: (context) => dialog.buildDialog(dialogAction, item),
    );
  }

  void onAdd() {
    _showDialog(DialogAction.add, null);
  }

  void onEdit(Dish item) {
    _showDialog(DialogAction.edit, item);
  }

  void onDelete(Dish item) {
    dishService.delete(item.id);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pageWidget.buildAppBar(
        context,
        'Admin Dishes',
        PageContext.admin,
      ),
      body: DishListViewWidget(
        stream: _stream,
        onRefresh: getData,
        onDelete: onDelete,
        onEdit: onEdit,
        dishListContext: DishListContext.admin,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAdd,
        child: const Icon(Icons.add),
      ),
    );
  }
}
