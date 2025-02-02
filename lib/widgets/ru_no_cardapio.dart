import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:ru_app/constants.dart';

class NoCardapio extends StatelessWidget {
  final String msg;
  final Color? color;
  final Color? textColor;

  const NoCardapio({
    super.key,
    required this.msg,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Card(
          elevation: 2,
          color: color,
          shadowColor: kSecondaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(milliseconds: 5000),
                animatedTexts: [
                  TypewriterAnimatedText(
                    msg,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
