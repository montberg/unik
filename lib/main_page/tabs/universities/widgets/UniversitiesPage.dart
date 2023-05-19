import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unik/main_page/tabs/universities/controllers/FakeUniversityListLoader.dart';
import 'package:unik/main_page/tabs/universities/widgets/UniversityCard.dart';
import '../controllers/FakeSpecialityListLoader.dart';
import '../controllers/UniversityListLoader.dart';
import '../interfaces/IUniversityListLoader.dart';
import 'FilterMenu.dart';

class ExpansionController extends GetxController {
  static var isExpanded = false.obs;
  static void change() {
    isExpanded.value = !isExpanded.value;
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void close() {
    isExpanded.value = false;
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

class UniversitiesPage extends StatefulWidget {
  const UniversitiesPage({Key? key}) : super(key: key);

  @override
  State<UniversitiesPage> createState() => _UniversitiesPageState();
}

class _UniversitiesPageState extends State<UniversitiesPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  //late bool _isOpen;
  late RxInt currentPageIndex;
  @override
  void initState() {
    super.initState();
    //_isOpen = false;
    currentPageIndex = 0.obs;
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    );
  }

  _toggleContainer() {
    print(_animation.status);
    if (ExpansionController.isExpanded.value) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  _changePage(index){
      currentPageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    final IUniversityListLoader loader = FakeUniversityListLoader();
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
                  ))
                ),
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
                    onPressed: () {
                      ExpansionController.change();
                      _toggleContainer();
                    }))
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Obx(()=>
               FutureBuilder<List<Widget>>(
                  future:
                      _loadList(currentPageIndex.value == 0 ? loader : FakeSpecialityListLoader()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      debugPrint(snapshot.error.toString());
                      return Column(
                        children: [Text("Что-то пошло не так..."), Text(snapshot.error.toString())],
                      );
                    } else if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        if (kDebugMode) {
                          print("hasdata");
                        }
                        return GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: snapshot.data ?? [],
                              ),
                            )
                        );
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
            ),
            Obx(
              () => GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: Visibility(
                    child: Container(color: Colors.black.withOpacity(0.6)),
                    visible: ExpansionController.isExpanded.value),
                onTapDown: (_) {
                  ExpansionController.change();
                  if (!ExpansionController.isExpanded.value) {
                    _toggleContainer();
                  }
                },
              ),
            ),
            //this one
            SizeTransition(
                sizeFactor: _animation,
                axis: Axis.vertical,
                child: FilterMenu(onStateSelected: _changePage,)),
          ],
        ),
      ),
    );
  }

  Future<List<Widget>> _loadList(IUniversityListLoader loader) {
    return loader.loadList();
  }
}


