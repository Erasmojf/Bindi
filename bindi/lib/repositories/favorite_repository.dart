import 'package:bindi/models/ad.dart';
import 'package:bindi/models/user.dart';
import 'package:bindi/repositories/parse_errors.dart';
import 'package:bindi/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class FavoriteRepository {
  Future<void> save({Ad ad, User user}) async {
    final favoriteObject = ParseObject(keyFavoritesTable);

    favoriteObject.set<String>(keyFavoritesOwner, user.id);

    favoriteObject.set<ParseObject>(
      keyFavoritesAd,
      ParseObject(keyAdTable)..set(keyAdId, ad.id),
    );

    final response = await favoriteObject.save();
    if (!response.success)
      return Future.error(ParseErrors.getDescription(response.error.code));
  }

  Future<void> delete({Ad ad, User user}) async {
    try {
      final queryBuilder =
          QueryBuilder<ParseObject>(ParseObject(keyFavoritesTable));

      queryBuilder.whereEqualTo(keyFavoritesOwner, user.id);
      queryBuilder.whereEqualTo(
          keyFavoritesAd, ParseObject(keyAdTable)..set(keyAdId, ad.id));

      final response = await queryBuilder.query();

      if (response.success && response.results != null) {
        for (final f in response.results as List<ParseObject>) {
          await f.delete();
        }
      }
    } catch (e) {
      return Future.error('Falha ao deletar favorito');
    }
  }
}
