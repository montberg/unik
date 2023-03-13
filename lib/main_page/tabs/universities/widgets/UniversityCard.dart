import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class University{
  String image;
  String city;
  String name;
  bool favourite;
  bool accreditation;
  bool dorms;
  bool militarydep;
  University({required this.image,  required this.city,  required this.name,  required this.favourite,  required this.accreditation,  required this.dorms,  required this.militarydep}){
    image = image;
    city = city;
    name = name;
    favourite = favourite;
    accreditation = accreditation;
    dorms = dorms;
    militarydep = militarydep;
  }
}

class UniversityCard extends StatelessWidget {
  final University university;

  const UniversityCard({Key? key, required this.university}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: (){},
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
                      child: CachedNetworkImage(
                        height: 200,
                        fit: BoxFit.fitHeight,
                        imageUrl: university.image,
                        placeholder: (context, url) => const SizedBox(child: Center(child: CircularProgressIndicator()), height: 200,),
                        errorWidget: (context, url, error) => Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.error, color: Colors.black.withOpacity(0.5)),
                            Text("Не удалось загрузить изображение :(", style: TextStyle(color: Colors.black.withOpacity(0.5)),)
                          ],
                        ),
                      ),
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      university.favourite = !university.favourite;
                    },
                    icon : Stack(
                      children: [
                        const Positioned(
                          left: 1.0,
                          top: 2.0,
                          child: Icon(Icons.favorite, color: Colors.black54),
                        ),
                        Icon(Icons.favorite, color: university.favourite ? Colors.red : Colors.white),
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
                    AutoSizeText(university.city, style: Get.theme.textTheme.button?.copyWith(color: Get.theme.textTheme.button?.color?.withOpacity(0.6))),
                    const SizedBox(height: 10),
                    AutoSizeText(university.name, style: Get.theme.textTheme.button?.copyWith(fontWeight: FontWeight.w800))
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
