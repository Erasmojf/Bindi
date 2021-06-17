import 'package:bindi/models/adress.dart';
import 'package:bindi/models/category.dart';
import 'package:bindi/models/user.dart';

enum AdStatus { PENDING, ACTIVE, SOLD, DELETED }

class Ad {
  String id;
  List images;

  String title;
  String description;

  Category category;

  Address address;

  num price;
  bool hidePhone;

  AdStatus status = AdStatus.PENDING;
  DateTime created;

  User user;
  int views;
}
