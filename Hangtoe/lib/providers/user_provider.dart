import '../models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final newUserDataProivder = StateProvider<UserModel?>((ref) {
  return null;
});

final nickname1Proivder = StateProvider<String>((ref) {
  return "";
});

final nickname2Proivder = StateProvider<String>((ref) {
  return "";
});

final playernameProivder = StateProvider<String>((ref) {
  return "";
});