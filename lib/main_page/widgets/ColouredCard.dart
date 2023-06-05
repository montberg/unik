import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColouredCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final double? elevation;
  final GestureTapCallback? onTap;
  final double? height;
  final double? iconSize;
  final EdgeInsets? iconPadding;
  final Alignment? iconAlign;
  const ColouredCard(
      {Key? key,
        required this.icon,
        required this.text,
        required this.color,
        this.onTap,
        this.elevation,
        this.height,
        this.iconSize,
        this.iconPadding,
        this.iconAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation ?? 10,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(10),
      color: color,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              height: height ?? 200,
            ),
            Positioned.fill(
              child: Align(
                  alignment: iconAlign ?? Alignment.topRight,
                  child: Padding(
                    padding: iconPadding ?? EdgeInsets.zero,
                    child: Icon(icon,
                        color: Colors.white.withOpacity(0.9),
                        size: iconSize ?? 120),
                  )),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(text,
                      maxLines: 2,
                      wrapWords: false,
                      style: GoogleFonts.montserrat(
                          fontSize: 30,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.w700)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
