import 'package:bindi/models/city.dart';
import 'package:bindi/models/uf.dart';

class Address {
  Address({this.uf, this.city, this.cep, this.distriict});

  UF uf;
  City city;

  String cep;
  String distriict;

  @override
  String toString() {
    return 'Address{uf: $uf, city: $city, cep: $cep, distriict: $distriict}';
  }
}
