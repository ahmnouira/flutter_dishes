import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';
import 'package:flutter_dishes/src/theme/breakpoint.dart';
import 'package:flutter_dishes/src/ui/widgets/dish_item_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/loading_widget.dart';

enum DishListContext { user, userFavorite, admin }

class DishListViewWidget extends StatelessWidget {
  final Stream<QuerySnapshot<Object?>>? stream;
  final DishListContext dishListContext;
  final void Function(Dish item)? onEdit;
  final void Function(Dish item)? onDelete;
  final void Function(Dish item)? onToggleFavorite;
  final Future<void> Function() onRefresh;

  final String uid;

  const DishListViewWidget({
    super.key,
    required this.stream,
    required this.dishListContext,
    required this.uid,
    required this.onRefresh,
    this.onEdit,
    this.onDelete,
    this.onToggleFavorite,
  });

  Widget _buildListItem(BuildContext _, DocumentSnapshot snapshot) {
    final item = Dish.fromSnapshot(snapshot);

    final isFavorite = item.favoriteBy.contains(uid);

    return DishItemWidget(
      item: item,
      onDelete: onDelete,
      onEdit: onEdit,
      onToggleFavorite: onToggleFavorite,
      dishListContext: dishListContext,
      isFavorite: isFavorite,
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot>? snapshots) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: Breakpoint.x05),
      children:
          snapshots!.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: StreamBuilder<QuerySnapshot>(
        stream: stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const LoadingWidget();
          }

          return _buildList(context, snapshot.data?.docs);
        },
      ),
    );
  }
}
