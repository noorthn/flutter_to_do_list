import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'controllers/home_controller.dart';
import 'widget/modal/create_task.dart';
import 'widget/ui/banner.dart';
import 'widget/ui/categories_list.dart';
import 'widget/ui/filter_text_field.dart';
import 'widget/ui/task_card.dart';
import 'widget/ui/title.dart';


class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  
  background(){
    return Container(
      width     : Get.width,
      height    : Get.height / 2.3,
      margin    : const EdgeInsets.symmetric(horizontal: 10, vertical:10),
      decoration: const BoxDecoration(
        borderRadius  : BorderRadius.all(Radius.circular(50)),
        image         : DecorationImage(image: AssetImage('assets/images/home_bg.jpg'), fit: BoxFit.cover)
      )
    );
  }

  body(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        const TitleWidget(),
        const FilterApp(),
        Obx(() => Expanded(
          child: ListView(
            padding : const EdgeInsets.all(0),
            children:  [
              const BannerWidget(),
              
              const CategoryList(),
              
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 35),
                child :  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('My Task'),
                    Divider(color: Colors.white70,),
                  ]
                )
              ),

              for(var item in controller.tasks)
                const TaskCard()

            ]
          )
        ))
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body        : Stack(
        children: [
          background(),
          body()
        ]
      ),
      floatingActionButton: InkWell(
        onTap: () => Get.bottomSheet(const CreateTaskModal(), isScrollControlled: true, isDismissible: false),
        child: Container(
          width     : 60,
          height    : 60,
          padding   : const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color         : const Color.fromRGBO(254, 6, 145, 1),
            borderRadius  : BorderRadius.circular(15),
          ),
          child     : const Icon(Iconsax.add_square, color: Colors.white,),
        ),
      )
    );
  }
} 