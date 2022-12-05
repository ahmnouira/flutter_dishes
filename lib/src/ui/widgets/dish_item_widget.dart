import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';
import 'package:flutter_dishes/src/ui/widgets/dish_list_view_widget.dart';

class DishItemWidget extends StatelessWidget {
  final Dish item;
  final DishListContext dishListContext;

  final void Function(Dish item)? onEdit;
  final void Function(Dish item)? onDelete;
  final void Function(Dish item)? onToggleFavorite;

  const DishItemWidget({
    super.key,
    required this.item,
    required this.dishListContext,
    this.onEdit,
    this.onDelete,
    this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key(item.name),
      title: Text(item.name),
      trailing: Wrap(
        spacing: -8.0,
        children: [
          if (dishListContext == DishListContext.user)
            IconButton(
              onPressed: () {
                onToggleFavorite!(item);
              },
              icon: const Icon(
                Icons.favorite_outlined,
                color: Colors.yellow,
              ),
            ),
          if (dishListContext == DishListContext.admin)
            IconButton(
              onPressed: () {
                onEdit!(item);
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.green,
              ),
            ),
          IconButton(
            onPressed: () {
              onDelete!(item);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
