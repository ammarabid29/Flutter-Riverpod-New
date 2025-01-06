// to read constant value
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref) {
  return "Ammar";
});
final ageProvider = Provider<int>((ref) {
  return 23;
});
