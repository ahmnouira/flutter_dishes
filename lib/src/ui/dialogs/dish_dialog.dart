import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/ui/widgets/button_widget.dart';

enum DialogAction { add, edit }

class DishDialog {
  final _nameController = TextEditingController();

  Future<void> _submit(DialogAction dialogAction) async {
    print('$dialogAction');
  }

  Widget buildDialog(DialogAction dialogAction) {
    final bool isAdd = dialogAction == DialogAction.add;

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
            _submit(dialogAction);
          },
        ),
      ]),
    );
  }
}
