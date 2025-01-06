import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_new/features/simple_provider/provider/simple_provider.dart';

// Stateless Widget
// class SimpleProviderScreen extends ConsumerWidget {
//   const SimpleProviderScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final String name = ref.read(nameProvider);
//     final int age = ref.read(ageProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home Screen"),
//       ),
//       body: Center(
//         child: Text("$name $age"),
//       ),
//     );
//   }
// }

// Stateful Widget
class SimpleProviderScreen extends ConsumerStatefulWidget {
  const SimpleProviderScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SimpleProviderScreenState();
}

class _SimpleProviderScreenState extends ConsumerState<SimpleProviderScreen> {
  @override
  Widget build(BuildContext context) {
    final String name = ref.read(nameProvider);
    final int age = ref.read(ageProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Center(
        child: Text("$name $age"),
      ),
    );
  }
}
