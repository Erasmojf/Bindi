import 'package:bindi/models/category.dart';
import 'package:bindi/repositories/ad_repository.dart';
import 'package:bindi/stores/filter_store.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  _HomeStore() {
    autorun((_) async {
      final newAds = await AdRepository().getHomAdList(
        filter: filter,
        search: search,
        category: category,
      );
      print(newAds);
    });
  }
  @observable
  String search = '';

  @action
  void setSearch(String value) => search = value;

  @observable
  Category category;

  @action
  void setCategory(Category value) => category = value;

  @observable
  FilterStore filter = FilterStore();

  FilterStore get clonedFilter => filter.clone();

  @action
  void setFilter(FilterStore value) => filter = value;
}
