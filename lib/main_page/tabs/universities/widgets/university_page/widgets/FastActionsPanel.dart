import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class FastActionsPanel extends StatelessWidget {
  final double rating;
  final double placeInRating;
  final String pricesLink;
  final String budgetPlacesLink;
  final String websiteLink;

  const FastActionsPanel({Key? key,
    required this.rating,
    required this.placeInRating,
    required this.pricesLink,
    required this.budgetPlacesLink,
    required this.websiteLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      rating.toString(),
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w900, fontSize: 30),
                    ),
                    Text("Рейтинг",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w800),)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      placeInRating.toString(),
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w900, fontSize: 30),
                    ),
                    Text("Место в рейтинге", style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800),)
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.tight,
                flex: 5,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  //shadowColor: Colors.black.withOpacity(0.5),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () { _launchUrl(pricesLink);},
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.price_change,
                            size: 50,
                          ),
                          AutoSizeText(
                            "Стоимость обучения",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w800),
                            maxLines: 1,
                            minFontSize: 0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                fit: FlexFit.tight,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  //shadowColor: Colors.black.withOpacity(0.5),
                  child: InkWell(
                    onTap: () {_launchUrl(budgetPlacesLink);},
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.price_check_rounded,
                            size: 50,
                          ),
                          AutoSizeText(
                            "Бюджетные места",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w800),
                            maxLines: 1,
                            minFontSize: 0,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  //sshadowColor: Colors.black.withOpacity(0.5),
                  child: InkWell(
                    onTap: () {_launchUrl(websiteLink);},
                    borderRadius: BorderRadius.circular(10),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.vpn_lock,
                            size: 40,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AutoSizeText("Сайт", style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w800))
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Future<void> _launchUrl(String _url) async {
    if (!await launchUrl(Uri.parse(_url), mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $_url');
    }

  }
}