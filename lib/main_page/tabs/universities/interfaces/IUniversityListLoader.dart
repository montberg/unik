import 'package:flutter/material.dart';

class IUniversityListLoader{
  Future<List<Widget>>? universityList() {
    return null;
  }
}

class UniversityListLoaderImplementation implements IUniversityListLoader {
  @override
  Future<List<Widget>> universityList() async {
    return Future<List<Widget>>.delayed(
      const Duration(seconds: 2),
          () => [Text("loaded")],
    );
  }

}
