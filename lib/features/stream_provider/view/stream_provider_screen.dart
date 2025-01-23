import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_new/features/stream_provider/provider/stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Provider"),
      ),
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final provider = ref.watch(streamProvider);
            return provider.when(
              skipLoadingOnRefresh: false,
              data: (price) => Text(
                'Price: $price',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              loading: () => CircularProgressIndicator(),
              error: (error, stack) => TextButton(
                child: Text('Error: $error'),
                onPressed: () {
                  ref.invalidate(streamProvider);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
