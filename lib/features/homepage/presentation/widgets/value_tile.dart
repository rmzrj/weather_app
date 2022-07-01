import 'package:flutter/material.dart';

/// General utility widget used to render a cell divided into three rows
/// First row displays [label]
/// second row displays [iconData]
/// third row displays [value]
class ValueTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData? iconData;

  const ValueTile({
    Key? key,
    required this.label,
    required this.value,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(color: Colors.black.withAlpha(80)),
        ),
        const SizedBox(
          height: 5,
        ),
        iconData != null
            ? Icon(
                iconData,
                color: Colors.black,
                size: 20,
              )
            : const SizedBox(),
        const SizedBox(
          height: 10,
        ),
        Text(
          value,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
