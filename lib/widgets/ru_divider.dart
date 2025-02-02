import 'package:flutter/material.dart';
import 'package:ru_app/constants.dart';

class RuDivider extends StatelessWidget {
  final String name;

  const RuDivider({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5,
        color: kDividerColor,
        margin: const EdgeInsets.only(
          top: 8,
          bottom: 8,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
