import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';
import 'package:flutter_dishes/src/enums/dist_list_context_eum.dart';
import 'package:flutter_dishes/src/theme/breakpoint.dart';

class DishItemWidget extends StatelessWidget {
  final Dish item;
  final DishListContext dishListContext;

  final void Function(Dish item)? onEdit;
  final void Function(Dish item)? onDelete;
  final void Function(Dish item)? onToggleFavorite;
  final bool isFavorite;

  const DishItemWidget({
    super.key,
    required this.item,
    required this.dishListContext,
    this.onEdit,
    this.onDelete,
    this.onToggleFavorite,
    this.isFavorite = false,
  });

  Widget? _buildTrailing() {
    final favoriteIcon = isFavorite
        ? const Icon(
            Icons.star,
            color: Colors.yellow,
          )
        : const Icon(
            Icons.star_outline,
            color: Colors.grey,
          );

    Widget? trailing;
    if (dishListContext == DishListContext.user) {
      trailing = IconButton(
        onPressed: () {
          onToggleFavorite!(item);
        },
        icon: favoriteIcon,
      );
    } else if (dishListContext == DishListContext.userFavorite) {
      trailing = const IconButton(
        onPressed: null,
        icon: Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      );
    } else if (dishListContext == DishListContext.admin) {
      trailing = Wrap(
        spacing: -Breakpoint.y1,
        children: [
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
              color: Colors.redAccent,
            ),
          ),
        ],
      );
    }

    return trailing;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(item.name), trailing: _buildTrailing());
  }
}
