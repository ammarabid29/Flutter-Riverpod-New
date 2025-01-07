import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_new/features/state_notifier_provider/favorite_app/provider/favorite_provider.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteList = ref.watch(favoriteProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Accessories List"),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              ref.read(favoriteProvider.notifier).showFavorite(value);
            },
            itemBuilder: (ctx) {
              return const [
                PopupMenuItem(
                  value: "All",
                  child: Text("All"),
                ),
                PopupMenuItem(
                  value: "Favorite",
                  child: Text("Favorite"),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                ref.read(favoriteProvider.notifier).filterList(value);
              },
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: favoriteList.filteredItems.length,
              itemBuilder: (ctx, index) {
                final item = favoriteList.filteredItems[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: InkWell(
                    onTap: () {
                      ref
                          .read(favoriteProvider.notifier)
                          .toggleFavorite(item.id);
                    },
                    child: Icon(
                      item.favorite ? Icons.favorite : Icons.favorite_border,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.watch(favoriteProvider.notifier).addItems();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
