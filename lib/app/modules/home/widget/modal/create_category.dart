// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/home_child_controller.dart';


class CreateCategoryModal extends GetView<CreateTaskController> {
  const CreateCategoryModal({super.key});

  field(TextEditingController cont, {String label = ''}){
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
          controller: cont,
          decoration: InputDecoration(
          border    : InputBorder.none,
          filled    : true,
          fillColor : Colors.white10,
          hintStyle : const TextStyle(color: Colors.white54),
          hintText  : label,
          enabledBorder:  const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(width: 3, color: Colors.transparent)),
          focusedBorder:  const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(width: 3, color: Colors.transparent)),
        )
      )
    );
  }



  @override
  Widget build(BuildContext context) {
    Get.put(CreateTaskController());
    return Container(
      height:Get.height / 1.5,
      padding: const EdgeInsets.all(20),
      decoration:  BoxDecoration(
        color         :  Get.theme.scaffoldBackgroundColor,
        borderRadius  : const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('New Category'),
              InkWell(
                onTap: (){Get.back();},
                child: const Icon(Iconsax.close_square, color: Colors.white70)
              )
            ]
          ),
          const Divider(color: Colors.white60),
          const SizedBox(height: 5),

           Expanded(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 80,
                      margin: const EdgeInsets.only( right: 15),
                      child: Center(
                        child: TextFormField(
                          controller: controller.iconCt,
                          decoration: const InputDecoration(
                            border    : InputBorder.none,
                            filled    : true,
                            fillColor : Colors.white10,
                            hintStyle : TextStyle(color: Colors.white54),
                            hintText  : '🏀',
                            enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(width: 3, color: Colors.transparent)),
                            focusedBorder:  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(width: 3, color: Colors.transparent)),
                          ),
                          maxLength: 1,
                          style: const TextStyle(color: Colors.white),
                        ),
                      )
                    ),
                    Expanded(
                      child: field(
                        controller.titleCt,
                        label: 'Title'
                      ),
                    )
                  ]
                ),

                const SizedBox(height: 20),
                InkWell(
                  onTap: () => controller.createCategory(),
                  child: Container(
                    width     : double.infinity,
                    height    : 60,
                    padding   : const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color         : const Color.fromRGBO(254, 6, 145, 1),
                      borderRadius  : BorderRadius.circular(15),
                    ),
                    child     : const Center(child: Text('Create Category', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                  )
                ),
              ],
            ),
          )
        ]
      )
    );
  }
}