import 'package:flutter/material.dart';
import 'package:flutter_dishes/src/data/model/dish_model.dart';
import 'package:flutter_dishes/src/ui/widgets/dish_list_view_widget.dart';
import 'package:flutter_dishes/src/ui/widgets/loading_widget.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  static const routeName = 'favorites';

  @override
  State<FavoritesPage> createState() => _FavoritesPage();
}

class _FavoritesPage extends State<FavoritesPage> {
  bool _isLoading = true;

  List<Dish> _list = [];

  Future getData() async {
    setState(() {
      _list = [];
      _isLoading = false;
    });
  }

  @override
  void initState() {
    setState(() {
      _isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dishes'),
      ),
      body: _isLoading
          ? const LoadingWidget()
          : RefreshIndicator(
              onRefresh: getData,
              child: DishListViewWidget(
                list: _list,
                dishListContext: DishListContext.userFavorite,
              ),
            ),
    );
  }
}
