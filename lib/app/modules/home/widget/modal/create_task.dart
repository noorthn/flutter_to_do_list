// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:iconsax/iconsax.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../controllers/home_child_controller.dart';


class CreateTaskModal extends GetView<CreateTaskController> {
  const CreateTaskModal({super.key});

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

  check({String title = 'Title', bool value = false, dynamic onTap}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            child: value ? const Icon(Icons.check, color: Colors.white70) :  Container(),
          ),
        )
      ]
    );
  }

  priority(){
    return Container(
      padding : const EdgeInsets.only(left    : 15, right: 15, top: 8),
      margin  : const EdgeInsets.only(bottom: 15),
      height  : 65,
      decoration      : BoxDecoration(
        color: Colors.white10,
        borderRadius  : BorderRadius.circular(10.0),
      ),
      child         : DropdownButton<String>(
        value       : controller.priority.value,
        borderRadius  : BorderRadius.circular(10),
        dropdownColor : Get.theme.scaffoldBackgroundColor,
        isExpanded    : true,
        icon          : const RotatedBox(quarterTurns  : 1,child: Icon(Icons.chevron_right, color: Colors.white70)),
        items: controller.homeController.priorities.map((item) => DropdownMenuItem(
          value: item,
          child: Text(item,style: Get.textTheme.bodyLarge!.copyWith(color: Colors.white70), )
        )).toList(),
        onChanged: (dynamic value) async {controller.priority = value;},
        underline: Container(),
      )
    );
  }

  datePicker(DateTime date, bool type){
    return InkWell(
      onTap: (){
        Get.dialog(
          Center(
            child: Container(
              padding : const EdgeInsets.only(left    : 15, right: 15, top: 18),
              margin  : const EdgeInsets.all( 20),
              height  : Get.height / 2 ,
              width: double.infinity,
              decoration      : BoxDecoration(
                color: Get.theme.scaffoldBackgroundColor,
                borderRadius  : BorderRadius.circular(10.0),
              ),
              child : SfDateRangePicker( 
                selectionTextStyle      : const TextStyle(color: Colors.white),
                selectionColor          : Get.theme.primaryColor,
                startRangeSelectionColor: Colors.white,
                todayHighlightColor     : Get.theme.primaryColor,
                rangeSelectionColor     :Get.theme.primaryColor,
                endRangeSelectionColor  : Get.theme.primaryColor,
                rangeTextStyle          : const TextStyle(color: Colors.white),
                selectionMode           : DateRangePickerSelectionMode.single,
                headerStyle             : const DateRangePickerHeaderStyle(textStyle: TextStyle(color: Colors.white)),
                monthCellStyle          : const DateRangePickerMonthCellStyle(textStyle: TextStyle(color: Colors.white)),
                yearCellStyle           : const DateRangePickerYearCellStyle(textStyle: TextStyle(color: Colors.white)),
                monthViewSettings       : const DateRangePickerMonthViewSettings(
                  weekNumberStyle       : DateRangePickerWeekNumberStyle(textStyle: TextStyle(color: Colors.white)), 
                  viewHeaderStyle       : DateRangePickerViewHeaderStyle(textStyle: TextStyle(color: Colors.white)),
                  firstDayOfWeek: 1
                ),
                onSelectionChanged: (DateRangePickerSelectionChangedArgs value){
                  if(type){
                    controller.endDate = value.value;
                  }else{
                    controller.alartDate = value.value;
                  }
                }
              )
            )
          )
        );
      },
      child: Container(
        padding : const EdgeInsets.only(left    : 15, right: 15, top: 18),
        margin  : const EdgeInsets.only(bottom: 15),
        height  : 65,
        width: double.infinity,
        decoration      : BoxDecoration(
          color: Colors.white10,
          borderRadius  : BorderRadius.circular(10.0),
        ),
        child : Text(DateFormat('dd / MM / yyyy').format(date))
      ),
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
              const Text('New Task'),
              InkWell(
                onTap: (){Get.back();},
                child: const Icon(Iconsax.close_square, color: Colors.white70)
              )
            ]
          ),
          const Divider(color: Colors.white60),
          const SizedBox(height: 5),

           Obx(() =>Expanded(
            child: ListView(
              children: [
                field(
                  controller.iconCt,
                  label: 'Icon',
                ),
                field(
                  controller.titleCt,
                  label: 'Title'
                ),
                field(
                  controller.categoryCt,
                  label: 'Category'
                ),
                field(
                  controller.descriptionCt,
                  label: 'Description'
                ),
                priority(),
                const Divider(color: Colors.white10),

                check(
                  title: 'With deadline', 
                  value: controller.showEndDate.value,
                  onTap: (){controller.showEndDate = false;}
                ),
                const Divider(color: Colors.white10),
                  if(controller.showEndDate.value)
                    datePicker(controller.endDate.value, true),

                check(
                  title: 'With alert', 
                  value: controller.showAlert.value,
                  onTap: (){controller.showAlert = false;}
                ),
                const Divider(color: Colors.white10),
                  if(controller.showAlert.value)
                    datePicker(controller.alartDate.value, false),

                InkWell(
                  onTap: () => controller.createTask(),
                  child: Container(
                    width     : double.infinity,
                    height    : 60,
                    padding   : const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color         : const Color.fromRGBO(254, 6, 145, 1),
                      borderRadius  : BorderRadius.circular(15),
                    ),
                    child     : const Center(child: Text('Create task', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                  )
                ),
                const SizedBox(height: 50)
              ],
            ),
          ))
        ]
      )
    );
  }
}