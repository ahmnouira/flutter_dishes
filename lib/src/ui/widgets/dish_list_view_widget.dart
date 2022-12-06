import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';
import 'package:flutter_dishes/src/enums/dist_list_context_eum.dart';
import 'package:flutter_dishes/src/ui/widgets/dish_item_widget.dart';

class DishListViewWidget extends StatelessWidget {
  final List<Dish> list;
  final Future<void> Function() onRefresh;

  final String uid;

  const DishListViewWidget({
    super.key,
    required this.list,
    required this.uid,
    required this.onRefresh,
  });

  Widget _buildListItem(BuildContext _, Dish item) {
    return DishItemWidget(
      item: item,
      dishListContext: DishListContext.userFavorite,
      isFavorite: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          final item = list[index];

          return _buildListItem(context, item);
        },
      ),
    );
  }
}
