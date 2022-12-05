import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';
import 'package:flutter_dishes/src/theme/breakpoint.dart';
import 'package:flutter_dishes/src/ui/widgets/dish_item_widget.dart';

enum DishListContext { user, userFavorite, admin }

class DishListViewWidget extends StatelessWidget {
  final List<Dish> list;
  final DishListContext dishListContext;
  final void Function(Dish item)? onEdit;
  final void Function(Dish item)? onDelete;
  final void Function(Dish item)? onToggleFavorite;

  const DishListViewWidget({
    super.key,
    required this.list,
    required this.dishListContext,
    this.onEdit,
    this.onDelete,
    this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      padding: const EdgeInsets.symmetric(vertical: Breakpoint.x05),
      itemBuilder: (context, index) {
        final item = list[index];

        return DishItemWidget(
          item: item,
          onDelete: onDelete,
          onEdit: onEdit,
          dishListContext: DishListContext.admin,
        );
      },
    );
  }
}
