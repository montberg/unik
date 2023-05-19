import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unik/global_widgets/button.dart';
import 'package:unik/main_page/tabs/universities/University.dart';

import '../../../../global_widgets/CachedImage.dart';
import 'university_page/UniversityPage.dart';

class UniversityCardInfo {
  University university;
  bool favourite;

  UniversityCardInfo({
    required this.university,
    required this.favourite,
  });
}

class UniversityCard extends StatefulWidget {
  final UniversityCardInfo universityCardInfo;

  const UniversityCard({Key? key, required this.universityCardInfo})
      : super(key: key);

  @override
  State<UniversityCard> createState() => _UniversityCardState();
}

class _UniversityCardState extends State<UniversityCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            Get.to(UniversityPage(university: widget.universityCardInfo.university));
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.transparent,
                    child: ClipRRect(
                      child: Hero(
                          tag: widget.universityCardInfo.university.id,
                          child: CachedImage(
                            image: widget.universityCardInfo.university.image,
                            fit: BoxFit.cover,
                            height: 200,
                          )),
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(10)),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.universityCardInfo.favourite =
                        !widget.universityCardInfo.favourite;
                      });
                    },
                    icon: Stack(
                      children: [
                        const Positioned(
                          left: 1.0,
                          top: 2.0,
                          child: Icon(Icons.favorite, color: Colors.black54),
                        ),
                        Icon(Icons.favorite,
                            color: widget.universityCardInfo.favourite
                                ? Colors.red
                                : Colors.white),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Opacity(
                      opacity: 0.6,
                      child: AutoSizeText(
                          widget.universityCardInfo.university.universityContacts.city,
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(height: 5),
                    AutoSizeText(widget.universityCardInfo.university.name,
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.w800)),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
