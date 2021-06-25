import 'package:bindi/models/city.dart';
import 'package:bindi/models/uf.dart';

class Address {
  Address({this.uf, this.city, this.cep, this.district});

  UF uf;
  City city;

  String cep;
  String district;

  @override
  String toString() {
    return 'Address{uf: $uf, city: $city, cep: $cep, distriict: $district}';
  }
}
