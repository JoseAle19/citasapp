import 'package:flutter/material.dart';

Widget goToPage(BuildContext context, String route) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.black, borderRadius: BorderRadius.circular(20)),
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.only(top: 25),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        route.toUpperCase(),
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
