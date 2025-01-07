import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_new/features/state_notifier_provider/favorite_app/model/item.dart';
import 'package:flutter_riverpod_new/features/state_notifier_provider/favorite_app/provider/favorite_state.dart';

final favoriteProvider =
    StateNotifierProvider<FavoriteNotifier, FavoriteState>((ref) {
  return FavoriteNotifier();
});

class FavoriteNotifier extends StateNotifier<FavoriteState> {
  FavoriteNotifier()
      : super(FavoriteState(allItems: [], filteredItems: [], search: ""));

  void addItems() {
    List<Item> items = [
      Item(id: 1, name: "Macbook Air 2019", favorite: true),
      Item(id: 2, name: "Iphone 16", favorite: false),
      Item(id: 3, name: "G-force 3060", favorite: false),
      Item(id: 4, name: "Samsung S24 Ultra", favorite: true),
      Item(id: 5, name: "Google pixel 9", favorite: false),
      Item(id: 6, name: "Ipad pro 13", favorite: true),
    ];

    state =
        state.copyWith(allItems: items.toList(), filteredItems: items.toList());
  }

  void filterList(String search) {
    state = state.copyWith(filteredItems: _filterItems(state.allItems, search));
  }

  List<Item> _filterItems(List<Item> items, String query) {
    if (query.isEmpty) {
      return items;
    }
    return items
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void showFavorite(String favorite) {
    state =
        state.copyWith(filteredItems: _favoriteItems(state.allItems, favorite));
  }

  List<Item> _favoriteItems(List<Item> items, String query) {
    if (query == "All") {
      return items;
    }
    return items.where((item) => item.favorite).toList();
  }

  void toggleFavorite(int id) {
    final updatedAllItems = state.allItems.map((item) {
      if (item.id == id) {
        return item.copyWith(favorite: !item.favorite);
      }
      return item;
    }).toList();

    List<Item> updatedFilteredItems;

    if (state.filteredItems.every((item) => item.favorite)) {
      updatedFilteredItems =
          updatedAllItems.where((item) => item.favorite).toList();
    } else {
      updatedFilteredItems = updatedAllItems;
    }

    state = state.copyWith(
      allItems: updatedAllItems,
      filteredItems: updatedFilteredItems,
    );
  }
}
