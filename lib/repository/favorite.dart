import 'package:flutter/cupertino.dart';
import 'package:kuis/repository/newsmodel.dart';

class FavoriteRepository {
  static final favoriteList = ValueNotifier<List<NewsModel>>([]);

  static void toggleFavorite(NewsModel model) {
    final currentValue = favoriteList.value;
    if (currentValue.contains(model)) {
      favoriteList.value = currentValue.where((item) => item != model).toList();
    } else {
      favoriteList.value = [...currentValue, model];
    }
  }

  static bool isFavorite(NewsModel model) {
    return favoriteList.value.contains(model);
  }
}