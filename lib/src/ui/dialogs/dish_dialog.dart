import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';
import 'package:flutter_dishes/src/services/dish_service.dart';
import 'package:flutter_dishes/src/ui/widgets/button_widget.dart';

enum DialogAction { add, edit }

class DishDialog {
  final _nameController = TextEditingController();

  bool _submitting = false;
  String _error = '';

  Future<void> _submit(DialogAction dialogAction, Dish? item) async {
    _submitting = true;
    _error = '';

    final dishService = DishService();

    try {
      if (dialogAction == DialogAction.add && item == null) {
        final dish = Dish(id: '', name: _nameController.text);
        dishService.add(dish);
      } else if (dialogAction == DialogAction.edit && item != null) {
        final dish = Dish(id: item.id, name: _nameController.text);
        dishService.edit(dish);
      }
    } catch (e) {
      print('error $e');
    }

    // check field
  }

  Widget buildDialog(DialogAction dialogAction, Dish? item) {
    final bool isAdd = dialogAction == DialogAction.add;

    if (!isAdd && item != null) {
      _nameController.text = item.name;
    }

    return AlertDialog(
      title: Text(isAdd ? 'Add Dish' : 'Edit Dish'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      scrollable: true,
      content: Column(children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(hintText: 'Dish name'),
        ),
        ButtonWidget(
          text: isAdd ? 'Add' : 'Save',
          onPressed: () {
            _submit(dialogAction, item);
          },
        ),
      ]),
    );
  }
}
