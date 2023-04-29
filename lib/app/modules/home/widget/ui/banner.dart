

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modal/create_category.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width     : double.infinity,
      margin    : const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding   : const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color   : Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Classify your tasks.', style: TextStyle(color: Colors.white),),
          const Text('Make easy!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
          const SizedBox(height: 15),
          InkWell(
            onTap: () => Get.bottomSheet(const CreateCategoryModal(),),
            child: Container(
              width     : 200,
              padding   : const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color       : const Color.fromRGBO(254, 6, 145, 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child : const Center(child: Text('Create Category', style: TextStyle( color: Colors.white),)),
            ),
          )
        ]
      )
    );
  }
}