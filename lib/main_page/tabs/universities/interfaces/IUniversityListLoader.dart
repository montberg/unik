import 'package:flutter/material.dart';

class IUniversityListLoader{
  IUniversityListLoader();
  Future<List<Widget>> loadList(){
    return Future<List<Widget>>.delayed(const Duration(seconds: 1), () => []);
  }
}