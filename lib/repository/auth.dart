import 'package:kuis/repository/favorite.dart';

class AuthRepository {
  static String? username;
  static final Map<String, String> _passwordMap = {
    "levi": "127",
    "faiz": "128",
    "harits": "156"
  };

  static bool login(String user, String password) {
    if (user.isEmpty || password.isEmpty) return false;
    if (!_passwordMap.containsKey(user)) return false;
    final result = _passwordMap[user] == password;
    if (result) {
      username = user;
    }
    return result;
  }

  static void logout() {
    username = null;
    FavoriteRepository.favoriteList.value = [];
  }

  static String? getUser() => username;
}
