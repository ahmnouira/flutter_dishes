import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/services/favorite_service.dart';
import 'package:flutter_dishes/src/ui/widgets/dish_list_view_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/page_widget.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  static const routeName = 'favorites';

  @override
  State<FavoritesPage> createState() => _FavoritesPage();
}

class _FavoritesPage extends State<FavoritesPage> {
  late final Stream<QuerySnapshot<Object?>>? _stream;

  String _getRouteArgument(String key) {
    final routeArguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;

    return routeArguments[key] as String;
  }

  Future<void> getData() async {
    final favoriteService = FavoriteService();

    final uid = _getRouteArgument('uid');
    setState(() {
      _stream = favoriteService.getAll(uid);
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageWidget.buildSimpleAppBar('User Favorite Dishes'),
      body: DishListViewWidget(
        stream: _stream,
        onRefresh: getData,
        dishListContext: DishListContext.userFavorite,
      ),
    );
  }
}
