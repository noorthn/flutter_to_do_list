

import 'package:flutter/material.dart';

class FilterApp extends StatelessWidget {

  const FilterApp({
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      width: double.infinity,
      child: TextFormField(
        decoration:   const InputDecoration(
          border    : InputBorder.none,
          filled    : true,
          fillColor : Colors.white10,
           hintStyle :   TextStyle(color: Colors.white54),
          hintText  : 'Find your next task!',
          enabledBorder:   OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(width: 3, color: Colors.transparent)
                ),
          focusedBorder:   OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(width: 3, color: Colors.transparent)
                ),
        )
      ),
    );
  }
}