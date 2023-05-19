import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unik/global_widgets/CachedImage.dart';
import 'package:unik/main_page/tabs/universities/University.dart';
import 'package:unik/main_page/tabs/universities/widgets/university_page/widgets/UniversityContactInfoWidget.dart';
import '../../../../../global_widgets/button.dart';
import 'SpecialitiesPage.dart';
import 'widgets/FastActionsPanel.dart';
import 'widgets/InstituteListBuilder.dart';
import 'widgets/UniversityDescriptionWidget.dart';

class UniversityPage extends StatelessWidget {
  final University university;

  const UniversityPage({Key? key, required this.university}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: false,
            snap: false,
            backgroundColor: Colors.blue,
            floating: false,
            titleSpacing: 0,
            expandedHeight: 300 - kToolbarHeight,
            flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 50),
                title: SizedBox(
                  height: kToolbarHeight,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      university.name,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700)
                              .fontFamily),
                    ),
                  ),
                ),
                background: Stack(children: <Widget>[
                  Hero(
                    tag: university.id,
                    child: Center(
                        child: CachedImage(
                      image: university.image,
                      height: 300,
                      fit: BoxFit.cover,
                    )),
                  ),
                  Container(
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
                left: 8.0,
                right: 8.0,
                top: 20.0,
              ),
              child: FastActionsPanel(
                budgetPlacesLink: university.budgetPlacesLink,
                websiteLink: university.websiteLink,
                pricesLink: university.pricesLink,
                placeInRating: university.ratingPlacement ?? 0.0,
                rating: university.rating ?? 0.0,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: UniversityContactInfoWidget(
                  contactInfo: university.universityContacts),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: UniversityDescriptionWidget(desc: university.description),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: InstitutesListBuilder(institutes: university.institutes as List<Institute>, universityName: university.name,),
            ),
            const SizedBox(
              height: 20,
            ),
            //Padding(
            //  padding:
            //      const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            //  child: Button(
            //    isChevronBlack: true,
            //    onPressed: () {
            //      Get.to(SpecialitiesPage(specialities: university.specialities,));
            //    },
            //    child: Text("Список всех специальностей"),
            //  ),
            //)
                SizedBox(height: 10),
                Align(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: AutoSizeText(
                      university.name,
                      maxLines: 2,
                      maxFontSize: 16,
                      minFontSize: 11,
                      style: GoogleFonts.montserrat(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  alignment: Alignment.center,
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '2023',
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 20),
          ])),
        ],
      ),
    );
  }
}
