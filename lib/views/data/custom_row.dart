import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final String text1, text2, text3, text4;
  CustomRow(
      {Key? key,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            text1,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            text2,
          ),
        ),
        Expanded(
          child: Text(
            text3,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            text4,
          ),
        ),
      ],
    );
  }
}
