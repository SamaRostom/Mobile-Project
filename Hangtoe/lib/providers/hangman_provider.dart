import 'package:flutter_riverpod/flutter_riverpod.dart';


final wordProivder = StateProvider<String>((ref) {
  return "";
});

final timeProivder = StateProvider<int>((ref) {
  return 0;
});