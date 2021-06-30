import 'package:bindi/models/ad.dart';
import 'package:bindi/repositories/favorite_repository.dart';
import 'package:bindi/stores/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'favorite_store.g.dart';

class FavoriteStore = _FavoriteStore with _$FavoriteStore;

abstract class _FavoriteStore with Store {
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  ObservableList<Ad> favoriteList = ObservableList<Ad>();

  @action
  Future<void> toggleFavorite(Ad ad) async {
    try {
      if (favoriteList.any((a) => a.id == ad.id)) {
        favoriteList.removeWhere((a) => a.id == ad.id);
        await FavoriteRepository().delete(ad: ad, user: userManagerStore.user);
      } else {
        favoriteList.add(ad);
        await FavoriteRepository().save(ad: ad, user: userManagerStore.user);
      }
    } catch (e) {
      print(e);
    }
  }
}
