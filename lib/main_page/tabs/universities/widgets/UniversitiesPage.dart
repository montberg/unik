import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:unik/main_page/tabs/universities/interfaces/IUniversityListLoader.dart';



class ExpansionController extends GetxController {
  static var isExpanded = false.obs;
  static void change() {
    isExpanded.value = !isExpanded.value;
  }
  static void close() {
    ExpansionController.isExpanded.value = false;
  }
}

class UniversitiesPage extends StatelessWidget {
  const UniversitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "ВУЗЫ",
            style: Get.theme.textTheme.button,
          ),
          centerTitle: true,
          bottom: PreferredSize(

            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchController,
                    onEditingComplete: () {},
                    decoration: InputDecoration(
                        hintText: "Поиск",
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                            onPressed: () {
                              searchController.clear();
                            },
                            icon: const Icon(Icons.clear))),
                  ),
                )),
                Obx(() => IconButton(
                    icon: ExpansionController.isExpanded.value
                        ? const Icon(
                            Icons.close,
                            size: 30,
                          )
                        : const Icon(
                            Icons.filter_alt_outlined,
                            size: 30,
                          ),
                    onPressed: () => ExpansionController.change()))
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            FutureBuilder<List<Widget>>(
                future: UniversityListLoaderImplementation().universityList(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Column(
                      children: const [Text("Что-то пошло не так...")],
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      if (kDebugMode) {
                        print("hasdata");
                      }
                      return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [...snapshot.data!],
                            ),
                          ));
                    } else {
                      if (kDebugMode) {
                        print('error');
                      }
                      return const Icon(Icons.error);
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
            Obx(
              () => GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: Visibility(
                    child: Container(color: Colors.black.withOpacity(0.6)),
                    visible: ExpansionController.isExpanded.value),
                onTap: () => ExpansionController.close(),
                onVerticalDragStart: (_) => ExpansionController.close(),
              ),
            ),
            //this one
            Obx(() => Visibility(child: const FilterMenu(),visible: ExpansionController.isExpanded.value)),
          ],
        ),
      ),
    );
  }
}

const List<String> list = <String>['не важно', 'да', 'нет'];

class FilterMenu extends StatelessWidget {
  const FilterMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var milSelectedValue = list.first.obs;
    var accreditationSelectedValue = list.first.obs;
    var dormsSelectedValue = list.first.obs;
    var citySearchController = TextEditingController();
    return Material(
      child: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
          ),
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
                const Text("Поиск по"),
                SizedBox(height: 10),
                Center(
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
                      print('switched to: $index');
                    },
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Военная кафедра"),
                    Obx(()=>DropdownButton<String>(
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
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
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
                    Obx(()=>DropdownButton<String>(
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
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
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
                    const Text("Общежитие"),
                    Obx(()=>DropdownButton<String>(
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
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ))
                  ],
                ),
                const Divider(),
                TextButton(
                  onPressed: () {  },
                  style: TextButton.styleFrom(backgroundColor: Colors.blue, textStyle: Get.theme.textTheme.button!.copyWith(color: Colors.white)),
                  child: Container(child: Text("ПРИМЕНИТЬ", style: Get.theme.textTheme.button), width: double.infinity, alignment: Alignment.center,),
                ),
                TextButton(
                  onPressed: () {
                    milSelectedValue.value = list.first;
                    accreditationSelectedValue.value = list.first;
                    dormsSelectedValue.value = list.first;
                  },
                  style: TextButton.styleFrom(side: BorderSide(width: 1, color: Colors.black26)),
                  child: Container(child: Text("СБРОС", style: Get.theme.textTheme.button), width: double.infinity, alignment: Alignment.center,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
