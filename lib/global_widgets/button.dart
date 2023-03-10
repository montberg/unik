import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Button extends StatelessWidget {
  const Button({Key? key,
        this.child,
        this.onPressed,
        this.height,
        this.icon,
    required this.isChevronBlack}) : super(key: key);

  final bool isChevronBlack;
  final Widget? child;
  final double? height;
  final Icon? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.5),
      child: Stack(alignment: Alignment.center, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 70,
            width: double.infinity,
            child: TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                  elevation: 8,
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft),
              child: Row(
                children: [
                  Visibility(
                    visible: icon == null ? false : true,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: icon ?? SizedBox.shrink(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 22.0),
                    child: child ?? const Text("default"),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Align(
              child: Icon(Icons.chevron_right,
                  color: isChevronBlack ? Colors.black : Colors.white),
              alignment: Alignment.centerRight),
        )
      ]),
    );
  }
}