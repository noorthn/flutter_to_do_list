
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  item({String name = '', bool selected = false}){
    return Center(
      child: Container(
        height: 40,
        margin    : const EdgeInsets.only(left: 15),
        padding   : const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color       : selected ? const Color.fromRGBO(254, 6, 145, 1) :  Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15)
        ),
        child     : Center(child:  Text(name, style: TextStyle(color:  selected ? Colors.white : Colors.white60),))
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height  : 60,
      child   : ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 20),
          item(name: 'All'),
          item(name: 'Home'),
          item(name: 'Sport', selected: true),
          item(name: 'Games'),
          item(name: 'Studies'),
          item(name: 'Food'),
        ]
      )
    );
  }
}