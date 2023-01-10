import '../models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final userDataProviderRepository = StateProvider<Future?>(
  (ref) => null,
);


final userDataProvider = FutureProvider((ref) async {
  return ref.watch(userDataProviderRepository);
});


final newUserDataProivder = StateProvider<UserModel?>((ref) {
  return null;
});