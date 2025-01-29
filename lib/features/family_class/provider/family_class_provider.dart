import 'package:flutter_riverpod/flutter_riverpod.dart';

final familyClassProvider = StateProvider.family<int, Map>((ref, map) {
  return map["id"] * 2;
});
