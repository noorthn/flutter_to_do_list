
// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';

import '../../../data/model/category_model.dart';
import '../../../data/model/task_model.dart';

class HomeController extends GetxController{

   
  List<String> _priorities                          = ['High', 'Medium', 'Low'];
  List<String> get priorities                       => _priorities;

  RxList<Category> _categories                      = RxList<Category> ([Category(id: 0,icon: '🏆', name: 'All')]);
  RxList<Category> get categories                   => _categories;
  addCategory(Category category){ _categories.add(category);             update();}

  Rx<Category> _category                            =  Category().obs;
  Rx<Category> get category                         => _category;
  set category(data){_category.value                = data; update();}

  RxList<Task> _tasks                               = RxList<Task> ([]);
  RxList<Task> get tasks                            => _tasks;
  addTask(Task task){ _tasks.add(task);             update();}


}