import 'package:flutter/src/widgets/framework.dart';
import 'package:unik/main_page/tabs/universities/interfaces/IUniversityListLoader.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../University.dart';
import '../widgets/UniversityCard.dart';
class UniversityListLoader extends IUniversityListLoader{
  @override
  Future<List<Widget>> loadList() async {
    final universitiesJson = json.decode(await fetchData());
    List<dynamic> listOfData = universitiesJson.map((json) => University.fromJson(json)).toList();
    return listOfData.map((e) => UniversityCard(universityCardInfo: UniversityCardInfo(university: e, favourite: false))).toList();
  }

  Future<String> fetchData() async {
    final url = Uri.parse('http://brainstorm123-001-site1.atempurl.com/api/Institution/GetAll');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

}