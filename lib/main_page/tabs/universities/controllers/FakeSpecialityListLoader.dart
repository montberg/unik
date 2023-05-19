import 'package:flutter/src/widgets/framework.dart';
import 'package:unik/main_page/tabs/universities/widgets/university_page/SpecialityTile.dart';

import '../interfaces/IUniversityListLoader.dart';
var specialityList = [
  const SpecialityTile(code: '01.03.01', title: "Математика", id: 0),
  const SpecialityTile(code: '09.03.01', title: "Информатика и вычислительная техника", id: 1),
  const SpecialityTile(code: '09.03.02', title: "Информационные системы и технологии", id: 2),
  const SpecialityTile(code: '09.03.03', title: "Прикладная информатика", id: 3),
  const SpecialityTile(code: '09.03.04', title: "Программная инженерия", id: 4),
  const SpecialityTile(code: '10.03.01', title: "Информационная безопасность", id: 5),
  const SpecialityTile(code: '11.03.01', title: "Радиотехника", id: 6),
  const SpecialityTile(code: '11.03.02', title: "Инфокоммуникационные технологии и системы связи", id: 7),
];
class FakeSpecialityListLoader extends IUniversityListLoader {
  FakeSpecialityListLoader();

  @override
  Future<List<Widget>> loadList() async {
    return [];
  }
}
