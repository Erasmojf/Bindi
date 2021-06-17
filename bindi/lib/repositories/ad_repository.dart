import 'dart:io';

import 'package:bindi/models/ad.dart';
import 'package:bindi/repositories/parse_errors.dart';
import 'package:bindi/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:path/path.dart' as path;

class AdRepository {
  Future<void> save(Ad ad) async {
    final paseImages = await saveImages(ad.images);

    final parseUser = ParseUser('', '', '')..set(keyUserId, ad.user.id);

    final adObject = ParseObject(keyAdTable);

    final parseAcl = ParseACL(owner: parseUser);
    parseAcl.setPublicReadAccess(allowed: true);
    parseAcl.setPublicWriteAccess(allowed: false);
    adObject.setACL(parseAcl);
    adObject.set<String>(keyAdTitle, ad.title);
    adObject.set<String>(keyAdDescription, ad.description);
    adObject.set<bool>(keyAdHidePhone, ad.hidePhone);
    adObject.set<num>(keyAdPrice, ad.price);
    adObject.set<int>(keyAdStatus, ad.status.index);

    adObject.set<String>(keyAdDistrict, ad.address.distriict);
    adObject.set<String>(keyAdCity, ad.address.city.name);
    adObject.set<String>(keyAdFederativeUnit, ad.address.uf.initials);
    adObject.set<String>(keyAdPostalCode, ad.address.cep);

    adObject.set<List<ParseFile>>(keyAdImages, paseImages);
    adObject.set<ParseUser>(keyAdOwner, parseUser);

    adObject.set<ParseObject>(keyAdCategory,
        ParseObject(keyCategoryTable)..set(keyCategoryId, ad.category.id));

    final response = await adObject.save();
    print(response.success);
  }

  Future<List<ParseFile>> saveImages(List images) async {
    final parseImages = <ParseFile>[];
    try {
      for (final image in images) {
        if (image is File) {
          final parseFile = ParseFile(image, name: path.basename(image.path));
          final response = await parseFile.save();
          if (!response.success) {
            return Future.error(
                ParseErrors.getDescription(response.error.code));
          }
          parseImages.add(parseFile);
        } else {
          final parseFile = ParseFile(null);
          parseFile.name = path.basename(image);
          parseFile.url = image;
          parseImages.add(parseFile);
        }
      }
      return parseImages;
    } catch (e) {
      return Future.error('Falha ao salvar imagens');
    }
  }
}
