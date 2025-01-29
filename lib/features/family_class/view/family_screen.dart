import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_new/features/family_class/provider/family_class_provider.dart';

class FamilyScreen extends ConsumerWidget {
  const FamilyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map map = {
      'id': 10,
    };

    final result = ref.watch(familyClassProvider(map));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result.toString()),
          ],
        ),
      ),
    );
  }
}
