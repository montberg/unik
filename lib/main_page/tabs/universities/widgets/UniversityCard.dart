import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class UniversityCard extends StatelessWidget {
  final UniversityCardInfo universityCardInfo;

  const UniversityCard({Key? key, required this.universityCardInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () {
            Get.to(UniversityPage(university: universityCardInfo.university));
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.transparent,
                    child: ClipRRect(
                      child: Hero(tag: universityCardInfo.university.id, child: CachedImage(image: universityCardInfo.university.image, height: 200,)),
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(10)),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      universityCardInfo.favourite = !universityCardInfo.favourite;
                    },
                    icon: Stack(
                      children: [
                        const Positioned(
                          left: 1.0,
                          top: 2.0,
                          child: Icon(Icons.favorite, color: Colors.black54),
                        ),
                        Icon(Icons.favorite,
                            color: universityCardInfo.favourite
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
                    AutoSizeText(universityCardInfo.university.city,
                        style: Get.theme.textTheme.button?.copyWith(
                            color: Get.theme.textTheme.button?.color
                                ?.withOpacity(0.6))),
                    const SizedBox(height: 10),
                    AutoSizeText(universityCardInfo.university.name,
                        style: Get.theme.textTheme.button
                            ?.copyWith(fontWeight: FontWeight.w800))
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
