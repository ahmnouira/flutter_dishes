import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/ui/widgets/dish_list_view_widget.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  static const routeName = 'favorites';

  @override
  State<FavoritesPage> createState() => _FavoritesPage();
}

class _FavoritesPage extends State<FavoritesPage> {
  late final Stream<QuerySnapshot<Object?>>? _stream;

  Future getData() async {}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dishes'),
      ),
      body: DishListViewWidget(
        stream: _stream,
        onRefresh: getData,
        dishListContext: DishListContext.userFavorite,
      ),
    );
  }
}
