import 'package:flutter/material.dart';

Widget reusablebtn(Function ontap,String name){
  return ElevatedButton(
    style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color(0xff10414b)),
            foregroundColor:
                MaterialStateProperty.all(Color(0xff10414b)),
            overlayColor:
                MaterialStateProperty.all(Color(0xff10414b)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
    onPressed: (){ontap();}, child: Text(name,style: TextStyle(color: Colors.white),));
}