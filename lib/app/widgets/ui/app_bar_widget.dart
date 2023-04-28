

import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  navItem({String title = '', bool isSelected = false}){
    return Container(
      margin: const EdgeInsets.only(left: 30, top: 10),
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title, style:  isSelected  ? const TextStyle(color: Colors.white, fontWeight: FontWeight.bold) : const TextStyle(),),
          if(isSelected)
          Container(
            width: 15,
            height: 2.5,
            margin    : const EdgeInsets.only(right: 3),
            padding   : const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
          )
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(minWidth: 600, maxWidth: 1180),
        padding    : const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width     : 60,
              height    : 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image       : DecorationImage(image: AssetImage('assets/images/icon.png'))
              ) 
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                navItem(title: 'Inicio', isSelected: true),
                navItem(title: 'Sobre mí'),
                navItem(title: 'Proyectos'),
                navItem(title: 'Contacto'),
                navItem(title: 'Blog'),
              ]
            )
          ]
        )
      ),
    );
  }
}