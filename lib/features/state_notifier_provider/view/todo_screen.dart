import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod_new/features/state_notifier_provider/provider/item_provider.dart';

class TodoScreen extends ConsumerWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
      ),
      body: items.isEmpty
          ? Center(
              child: Text("Nothing to show"),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (ctx, index) {
                final item = items[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          ref
                              .read(itemProvider.notifier)
                              .updateItem(item.id, "Updated");
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          ref.read(itemProvider.notifier).deleteItem(item.id);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem("New Item");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
