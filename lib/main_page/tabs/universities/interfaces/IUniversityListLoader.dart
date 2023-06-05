import 'package:flutter/material.dart';

abstract class IUniversityListLoader{
  Future<List<Widget>> loadList(Filter filter);
}

class Filter {
  String? name;
  String? city;
  bool? militartdepartament;
  bool? accreditation;
  bool? dorms;
  Map<String, int>? points;

  Filter({this.name, this.city, this.militartdepartament, this.accreditation,
      this.dorms, this.points});

  void clearPoints() {
    points = null;
  }
}

abstract class ISpecialityListLoader{

  Future<List<Widget>> loadList({Filter? filter});
}

class SpecialityFilter {
  String? name;
  String? city;
  bool? militartdepartament;
  bool? accreditation;
  bool? dorms;
}