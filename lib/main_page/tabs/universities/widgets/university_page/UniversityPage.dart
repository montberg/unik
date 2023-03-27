import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unik/global_widgets/CachedImage.dart';
import 'package:unik/global_widgets/button.dart';
import 'package:unik/main_page/tabs/universities/University.dart';
import 'widgets/FastActionsPanel.dart';
import 'widgets/InstituteListBuilder.dart';
import 'widgets/UniversityDescriptionWidget.dart';

class UniversityPage extends StatelessWidget {
  final University university;

  const UniversityPage({Key? key, required this.university}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 300 - kToolbarHeight,
              flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.all(16),
                  title: LayoutBuilder(
                    builder: (context, constraints) => Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Text(
                          university.name,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16,
                              color: constraints.maxHeight > 30
                                  ? Colors.white
                                  : Colors.black),
                        ),
                      ],
                    ),
                  ),
                  centerTitle: true,
                  //titlePadding: EdgeInsets.all(16),
                  background: Stack(children: <Widget>[
                    Hero(
                      tag: university.id,
                      child: CachedImage(image: university.image, height: 300),
                    ),
                    Container(
                      // height: 300 - kToolbarHeight,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.6),
                          ],
                              stops: const [
                            0.6,
                            1.0
                          ])),
                    ),
                  ])),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 20.0,
                ),
                child: FastActionsPanel(
                  budgetPlacesLink: university.budgetPlacesLink,
                  websiteLink: university.websiteLink,
                  pricesLink: university.pricesLink,
                  placeInRating: university.ratingPlacement,
                  rating: university.rating,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child:
                    UniversityDescriptionWidget(desc: university.description),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: InstitutesListBuilder(institutes: university.institutes),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}

