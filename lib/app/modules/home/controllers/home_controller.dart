
// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';

import '../../../data/model/task_model.dart';

class HomeController extends GetxController{

   
  List<String> _priorities                          = ['High', 'Medium', 'Low'];
  List<String> get priorities                       => _priorities;

  RxList<Task> _tasks                               = RxList<Task> ([]);
  RxList<Task> get tasks                            => _tasks;
  addTask(Task task){ _tasks.add(task);             update();}

  createTask(){
    
  }


}