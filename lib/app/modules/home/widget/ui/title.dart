

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only( top: Get.height/10, left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Welcome back', style: TextStyle(height: 1, fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white70),),
          Text('Noorthn!', style: TextStyle(height: 1.2, fontWeight: FontWeight.bold, fontSize: 45, color: Colors.white70),),
        ],
      ),
    );
  }
}