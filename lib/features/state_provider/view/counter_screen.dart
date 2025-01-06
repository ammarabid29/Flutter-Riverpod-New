import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_new/features/state_provider/provider/state_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer(
              builder: (context, ref, child) {
                final counter = ref.watch(counterProvider);
                return Text(
                  counter.toString(),
                  style: TextStyle(fontSize: 30),
                );
              },
            ),
          ),
          Center(
            child: Consumer(
              builder: (context, ref, child) {
                final switchValue = ref.watch(switchProvider);
                return Switch(
                  value: switchValue,
                  onChanged: (value) {
                    ref.read(switchProvider.notifier).state = value;
                  },
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state--;
                },
                child: Icon(Icons.remove),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(counterProvider.notifier).state++;
                },
                child: Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
