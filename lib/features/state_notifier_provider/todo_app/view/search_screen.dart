import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_new/features/state_notifier_provider/todo_app/provider/search_provider.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              ref.read(searchProvider.notifier).search(value);
            },
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final search =
                  ref.watch(searchProvider.select((state) => state.search));
              return Text(search);
            },
          ),
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final isChange =
                  ref.watch(searchProvider.select((state) => state.isChange));
              return Switch(
                  value: isChange,
                  onChanged: (value) {
                    ref.watch(searchProvider.notifier).onChange(value);
                  });
            },
          ),
        ],
      ),
    );
  }
}
