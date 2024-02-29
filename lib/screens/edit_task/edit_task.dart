import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/utils/app_colors.dart';
import 'package:todo_list/utils/themes.dart';

class EditTask extends StatefulWidget {

  static const String routeName = 'Edit task';
  const EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = DateTime.now();
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Text(
          'To Do List',
          style: AppThemes.appBarTitle,
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.18,
      ),
      body: Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20))
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Add new Task',
              style: AppThemes.titleText,
              textAlign: TextAlign.center,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'enter your task',
                  hintStyle: AppThemes.regularText
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'enter your task',
                  hintStyle: AppThemes.regularText
              ),
            ),
            Text(
              'Select date',
              style: AppThemes.regularText.copyWith(color: AppColors.blackColorLight),
            ),
            InkWell(
              child: Text(
                DateFormat.yMd().format(selectedDate).toString(),
                style: AppThemes.regularText.copyWith(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              onTap: ()async{
                var date = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: selectedDate,
                    lastDate: selectedDate.add(const Duration(days: (365 * 5))));
                if(date != null){
                  selectedDate = date;
                  setState(() {});
                }
              },),
            ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))
                  )),
                    backgroundColor: MaterialStateColor.resolveWith((states) => AppColors.primaryColor)
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text(
                  'Save Change',
                  style: AppThemes.appBarTitle,
                )
            )
          ],
        ),
      ),
    );
  }
}
