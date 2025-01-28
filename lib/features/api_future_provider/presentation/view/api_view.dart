import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_new/features/api_future_provider/presentation/view_model/api_view_model.dart';

class ApiView extends ConsumerWidget {
  const ApiView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsList = ref.watch(postProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Get Api"),
      ),
      body: Center(
        child: postsList.when(
          skipLoadingOnRefresh: false,
          data: (data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (ctx, index) {
              final item = data[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(item.id.toString()),
                  ),
                  title: Text(item.title),
                  subtitle: Text(item.body),
                ),
              );
            },
          ),
          error: (error, stack) => TextButton(
            onPressed: () {
              ref.invalidate(postProvider);
            },
            child: Text("Error: $error"),
          ),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
