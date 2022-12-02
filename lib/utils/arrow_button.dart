import 'package:flutter/material.dart';

Widget arrowButton(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 30, left: 10),
    height: 50,
    width: 50,
    child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          size: 35,
        )),
  );
}
