
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/app/modules/home/controllers/home_controller.dart';

import '../../../../data/model/category_model.dart';

class CategoryList extends GetView<HomeController> {
  const CategoryList({super.key});

  item({required Category category, }){
    return InkWell(
      onTap: (){
        if(controller.category.value.id == category.id ){
          controller.category = Category();
        }else{
          controller.category = category;
        }
      },
      onLongPress: (){
        if(category.id != 0){
          controller.categories.removeWhere((e) => e.id == category.id);
        }
      },
      child: Center(
        child: Container(
          height: 40,
          margin    : const EdgeInsets.only(left: 15),
          padding   : const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            color       : controller.category.value.id == category.id ? const Color.fromRGBO(254, 6, 145, 1) :  Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15)
          ),
          child     : Center(child:  Text(category.icon!.isNotEmpty ?  '${category.icon!} ' '${category.name!}' : ''  '${category.name!}', style: TextStyle(color:  controller.category.value.id == category.id ? Colors.white : Colors.white60),))
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height  : 60,
      child   :  Obx(() =>  ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 20),
          for(var category in controller.categories)
            item(category: category),
        ]
      )
    ));
  }
}