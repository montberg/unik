import 'package:flutter/material.dart';

abstract class IUniversityListLoader{

  Future<List<Widget>> loadList();
}