import 'package:bindi/models/ad.dart';
import 'package:bindi/repositories/favorite_repository.dart';
import 'package:bindi/stores/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'favorite_store.g.dart';

class FavoriteStore = _FavoriteStore with _$FavoriteStore;

abstract class _FavoriteStore with Store {
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  Future<void> toggleFavorite(Ad ad) async {
    try {
      await FavoriteRepository().save(ad: ad, user: userManagerStore.user);
    } catch (e) {
      print(e);
    }
  }
}
