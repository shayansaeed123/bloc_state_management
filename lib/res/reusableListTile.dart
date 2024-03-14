import 'package:flutter/material.dart';

Widget reusabletile(String name,Function ontap,Icon icon) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal:  13.0, vertical: 6.0),
    child: ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      tileColor: Colors.white,
      title: Text(name),
      trailing: icon,
      onTap: () {
        // Add your onTap logic here
        ontap();
      },
    ),
  );
}
