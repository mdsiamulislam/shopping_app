import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class StorageService extends GetxService {
  late SharedPreferences _prefs;
  static const String _favoritesKey = 'favorite_product_ids';

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  List<int> getFavorites() {
    final List<String>? favorites = _prefs.getStringList(_favoritesKey);
    if (favorites == null) return [];
    return favorites.map((e) => int.parse(e)).toList();
  }

  Future<void> saveFavorites(List<int> favoriteIds) async {
    await _prefs.setStringList(
      _favoritesKey,
      favoriteIds.map((e) => e.toString()).toList(),
    );
  }
}
