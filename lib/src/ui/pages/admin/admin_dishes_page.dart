import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';
import 'package:flutter_dishes/src/services/auth_service.dart';
import 'package:flutter_dishes/src/services/dish_service.dart';
import 'package:flutter_dishes/src/ui/dialogs/dish_dialog.dart';
import 'package:flutter_dishes/src/ui/widgets/dish_list_view_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/page_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/snackbar.dart';

class AdminDishesPage extends StatefulWidget {
  const AdminDishesPage({super.key});
  static const routeName = 'admin/dishes';

  @override
  State<AdminDishesPage> createState() => _AdminDishesPage();
}

class _AdminDishesPage extends State<AdminDishesPage> {
  final DishService dishService = DishService();
  final AuthService authService = AuthService();

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
      builder: (context) => dialog.buildDialog(context, dialogAction, item),
    );
  }

  void onAdd() {
    _showDialog(DialogAction.add, null);
  }

  void onEdit(Dish item) {
    _showDialog(DialogAction.edit, item);
  }

  Future<void> onDelete(Dish item) async {
    await dishService.delete(item.id);
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
        uid: authService.uid.toString(),
        stream: _stream,
        onRefresh: getData,
        onDelete: (item) {
          onDelete(item).then((_) {
            snackBar(context, content: '${item.name} is deleted.');
          });
        },
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
