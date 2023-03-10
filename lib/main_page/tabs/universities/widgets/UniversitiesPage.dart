import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpansionController extends GetxController {
  static var isExpanded = false.obs;

  static void change(bool k) {
    ExpansionController.isExpanded.value = k;
  }
  static void close() {
    ExpansionController.isExpanded.value = false;
  }
}

class UniversitiesPage extends StatelessWidget {
  const UniversitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("TITLE"),
        bottom: PreferredSize(
          preferredSize: ExpansionController.isExpanded.value ? Size.fromHeight(200) : Size.fromHeight(kToolbarHeight),
          child: Column(
            children: [
              Obx(
                    ()=> ExpansionPanelList(
                  expandedHeaderPadding: EdgeInsets.zero,
                  expansionCallback: (h,isOpen) => ExpansionController.change(!isOpen),
                  children: [
                    ExpansionPanel(
                        body: const FilterMenu(),
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return TextField(textAlignVertical: TextAlignVertical.bottom);
                        },
                        isExpanded: ExpansionController.isExpanded.value),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          const Placeholder(),
          Obx(() => InkWell(
              child: Visibility(
                  child: Container(color: Colors.black.withOpacity(0.6)),
                  visible: ExpansionController.isExpanded.value),
              onTap: () => ExpansionController.close())),
          Obx(() => Visibility(
              child: GestureDetector(
                  onTap: () => ExpansionController.close(),
                  child: Container(color: Colors.transparent)),
              visible: ExpansionController.isExpanded.value)),
        ],
      ),
    );
  }
}

class FilterMenu extends StatelessWidget {
  const FilterMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Placeholder(fallbackHeight: 200),
      color: Colors.red,
    );
  }
}
