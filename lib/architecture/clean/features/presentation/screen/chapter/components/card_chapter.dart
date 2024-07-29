import 'package:flutter/material.dart';

class CardChapter extends StatelessWidget {
  final bool isSelected;
  final int id;
  final String name;

  const CardChapter({super.key, required this.id, required this.name, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(name),
      value: isSelected,
      onChanged: (bool? value) {},
    );
  }
}
