import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:get/get.dart';

import '../interfaces/IUniversityListLoader.dart';


final List<String> list = <String>['не важно', 'да', 'нет'];
class FilterMenu extends StatelessWidget {
  final Rx<Filter> filter;
  final IUniversityListLoader loader;
  final ISpecialityListLoader specialityListLoader;
  const FilterMenu({
    Key? key,
    required this.onStateSelected,
    required this.filter,
    required this.loader,
    required this.specialityListLoader,
  }) : super(key: key);
  final Function(int) onStateSelected;

  Future<List<Widget>> loadUniversities() {
    return loader.loadList(filter.value);
  }

  Future<List<Widget>> loadSpecialities() {
    return specialityListLoader.loadList(filter: filter?.value);
  }


  int getIndexByValue(bool? value){
    switch(value){
      case(null): return 0;
      case(true): return 1;
      case(false): return 2;
    }
    return 0;
  }

  bool? getValueByText(String value){
    switch(value){
      case('не важно'): return null;
      case('да'): return true;
      case('нет'): return false;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var milSelectedValue = list.first.obs;
    var accreditationSelectedValue = list.first.obs;
    var dormsSelectedValue = list.first.obs;
    var citySearchController = TextEditingController();
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: Get.theme.appBarTheme.backgroundColor,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: TextField(
                  controller: citySearchController,
                  onEditingComplete: () {},
                  decoration: InputDecoration(
                      hintText: "Город",
                      prefixIcon: const Icon(Icons.location_city),
                      suffixIcon: IconButton(
                          onPressed: () {
                            citySearchController.clear();
                          },
                          icon: const Icon(Icons.clear))),
                ),
              ),
              SizedBox(height: 10),
              Visibility(
                child: const Text("Поиск по"),
                visible: filter?.value?.points == null,
              ),
              Visibility(
                child: SizedBox(height: 10),
                visible: filter?.value?.points == null,
              ),
              Visibility(
                visible: filter?.value?.points == null,
                child: Center(
                  child: ToggleSwitch(
                    minWidth: double.infinity,
                    fontSize: 14.0,
                    animate: true,
                    animationDuration: 100,
                    initialLabelIndex: 0,
                    borderWidth: 1,
                    borderColor: [Colors.black26],
                    activeBgColor: [Colors.blue],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.white,
                    inactiveFgColor: Get.textTheme.button!.color,
                    totalSwitches: 2,
                    labels: ['ВУЗАМ', 'СПЕЦИАЛЬНОСТЯМ'],
                    onToggle: (index) {
                      onStateSelected(index!);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Военная кафедра"),
                  Obx(() => DropdownButton<String>(
                        value: milSelectedValue.value,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          milSelectedValue.value = value!;
                          filter?.update((val) {
                            filter?.value?.militartdepartament = getValueByText(value);
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ))
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Аккредитация"),
                  Obx(() => DropdownButton<String>(
                        value: accreditationSelectedValue.value,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          accreditationSelectedValue.value = value!;
                          filter?.update((val) {
                            filter?.value?.accreditation = getValueByText(value);
                          });
                        },
                        items: list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ))],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Общежитие"),
                  Obx(() => DropdownButton<String>(
                        value: dormsSelectedValue.value,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          dormsSelectedValue.value = value!;
                          filter?.update((val) {
                            filter?.value?.dorms = getValueByText(value);
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ))
                ],
              ),
              Obx(() => Visibility(
                    child: const Divider(),
                    visible: filter?.value?.points != null,
                  )),
              Obx(
                () => Visibility(
                  visible: filter?.value?.points != null,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: (() {
                              List<Widget> pointList = [];
                              filter?.value?.points?.forEach((key, value) {
                                pointList.add(Text(
                                  "$key : $value",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ));
                              });
                              return pointList;
                            }()),
                          ),
                          IconButton(
                              onPressed: () {
                                filter?.update((val) {
                                  filter?.value?.points = null;
                                });
                              },
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: Get.theme.textTheme.button!
                        .copyWith(color: Colors.white)),
                child: Container(
                  child: Text("ПРИМЕНИТЬ",
                      style: Get.theme.textTheme.button
                          ?.copyWith(color: Colors.white)),
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(
                onPressed: () {
                  milSelectedValue.value = list.first;
                  accreditationSelectedValue.value = list.first;
                  dormsSelectedValue.value = list.first;
                  filter?.update((val) {
                    filter?.value?.militartdepartament = getValueByText(list.first);
                    filter?.value?.accreditation = getValueByText(list.first);
                    filter?.value?.dorms = getValueByText(list.first);
                  });
                },
                style: TextButton.styleFrom(
                    side: BorderSide(width: 1, color: Colors.black26)),
                child: Container(
                  child: Text("СБРОС", style: Get.theme.textTheme.button),
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
