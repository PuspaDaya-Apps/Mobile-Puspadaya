import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_name.dart';

class SharedPrefUtils {
  //example 
  Future<void> storedExample (String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPrefName.EXAMPLE, value);
  }

  Future<String?> getExample () async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefName.EXAMPLE); 
  }

  Future<void> removeExample() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove(SharedPrefName.EXAMPLE);
  }
}