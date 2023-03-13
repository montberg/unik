import 'package:flutter/material.dart';

import '../widgets/UniversityCard.dart';

class UniversityListLoaderImplementation {
  Future<List<Widget>> universityList() async {
    print('sending...');
    List<Widget> a = [];
    var b = University(
        favourite: true,
        accreditation: true,
        image: "https://random.imagecdn.app/500/150",
        dorms: true,
        militarydep: false,
        name: 'Кубанский государственный технологический университет',
        city: 'Краснодар');
    for (var i = 0; i < 10; i++) {
      a.add(UniversityCard(university: b));
    }
    return Future<List<Widget>>.delayed(
      const Duration(seconds: 2),
      () => a);
  }
}
