import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
Future<void> setupLocator() async {
  final SharedPreferences _sharedPreference =
      await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(_sharedPreference);
}
