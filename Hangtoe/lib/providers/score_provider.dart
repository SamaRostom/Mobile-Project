import 'package:flutter_riverpod/flutter_riverpod.dart';

final scoreProivder = StateProvider<int>((ref) {
  return 0;
});

final typeofgameProivder = StateProvider<String>((ref) {
  return "";
});

final scoreOProivder = StateProvider<int>((ref) {
  return 0;
});

final scoreXProivder = StateProvider<int>((ref) {
  return 0;
});