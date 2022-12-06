import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';
import 'package:flutter_dishes/src/services/auth_service.dart';
import 'package:flutter_dishes/src/services/dish_service.dart';
import 'package:flutter_dishes/src/ui/widgets/dish_list_view_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/page_widget.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  static const routeName = 'favorites';

  @override
  State<FavoritesPage> createState() => _FavoritesPage();
}

class _FavoritesPage extends State<FavoritesPage> {
  late final List<Dish> _list;
  final authService = AuthService();

  Future<void> _getData() async {
    final dishService = DishService();
    final list =
        await dishService.getAllFavoriteByUid(authService.uid.toString());
    setState(() {
      _list = list;
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageWidget.buildSimpleAppBar('User Favorite Dishes'),
      body: DishListViewWidget(
        uid: authService.uid.toString(),
        onRefresh: _getData,
        list: _list,
      ),
    );
  }
}
