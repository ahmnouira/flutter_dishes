import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';
import 'package:flutter_dishes/src/services/dish_service.dart';
import 'package:flutter_dishes/src/theme/breakpoint.dart';
import 'package:flutter_dishes/src/ui/widgets/button_widget.dart';
import 'package:flutter_dishes/src/utils/check_fields.dart';

enum DialogAction { add, edit }

class DishDialog {
  final _nameController = TextEditingController();

  bool _submitting = false;
  String _error = '';

  Future<void> _submit(
    BuildContext context,
    DialogAction dialogAction,
    Dish? item,
  ) async {
    _submitting = true;
    _error = '';

    final String error = checkField(_nameController.text);

    if (error.isNotEmpty) {
      _submitting = false;
      _error = error;

      return;
    }

    final dishService = DishService();

    try {
      if (dialogAction == DialogAction.add && item == null) {
        final dish = Dish(
          id: '',
          name: _nameController.text,
          createdAt: DateTime.now(),
          favoriteBy: [],
        );
        dishService.add(dish);
      } else if (dialogAction == DialogAction.edit && item != null) {
        final dish = Dish(
          id: item.id,
          name: _nameController.text,
          createdAt: item.createdAt,
          favoriteBy: item.favoriteBy,
        );
        dishService.edit(dish);
      }

      Navigator.of(context).pop();
    } catch (e) {
      print('error $e');
    }
    // check field
  }

  Widget buildDialog(
    BuildContext context,
    DialogAction dialogAction,
    Dish? item,
  ) {
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
        if (_error.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: Breakpoint.y1),
            child: Text(
              _error,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ButtonWidget(
          text: isAdd ? 'Add' : 'Save',
          onPressed: _submitting
              ? null
              : () {
                  _submit(context, dialogAction, item);
                },
        ),
      ]),
    );
  }
}
