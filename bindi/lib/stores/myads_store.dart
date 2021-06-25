import 'package:bindi/repositories/ad_repository.dart';
import 'package:bindi/stores/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'myads_store.g.dart';

class MyAdsStore = _MyAdsStore with _$MyAdsStore;

abstract class _MyAdsStore with Store {
  _MyAdsStore() {
    _getMyAds();
  }

  Future<void> _getMyAds() async {
    final user = GetIt.I<UserManagerStore>().user;

    final ads = AdRepository().getMyAds(user);
    print(ads);
  }
}
