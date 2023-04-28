// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../data/model/task_model.dart';
import 'home_controller.dart';

class CreateTaskController extends GetxController {
  
  final HomeController homeController = Get.find();
  
  TextEditingController iconCt                      = TextEditingController();
  TextEditingController titleCt                     = TextEditingController();
  TextEditingController categoryCt                  = TextEditingController();
  TextEditingController descriptionCt               = TextEditingController();
  TextEditingController deadLineCt                  = TextEditingController();
  

  RxBool _showAlert                                 = false.obs;
  RxBool get showAlert                              =>  _showAlert;
  set showAlert(data){_showAlert.value              = _showAlert.value ? false : true; update();}
  
  RxBool _showEndDate                               = false.obs;
  RxBool get showEndDate                            =>  _showEndDate;
  set showEndDate(data){_showEndDate.value          = _showEndDate.value ? false : true; update();}

  RxString _priority                                = 'High'.obs;
  RxString get priority                             =>  _priority;
  set priority(data){_priority.value                = data; update();}
  
  Rx<DateTime> _endDate                             =  DateTime.now().obs;
  Rx<DateTime> get endDate                          => _endDate;
  set endDate(data){_endDate.value                  = data; update();}
  
  Rx<DateTime> _alartDate                           =  DateTime.now().obs;
  Rx<DateTime> get alartDate                        => _alartDate;
  set alartDate(data){_alartDate.value              = data; update();}

  createTask(){

      homeController.addTask(Task(
      id          : homeController.tasks.length,
      icon        : iconCt.text,
      name        : titleCt.text,
      description : descriptionCt.text, 
      category    : categoryCt.text,
      priority    : homeController.priorities.indexOf(priority.value),
      withAlert   : showAlert.value ?  1  : 0,
      dateAlert   : '',
      endDate     : '',
      createDate  : DateTime.now().toString(),
    ));


    Get.back();
    update();
  }



}