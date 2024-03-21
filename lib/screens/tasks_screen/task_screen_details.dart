import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/firebase_app.dart';
import '../../models/tasks.dart';
import '../../providers/app_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/themes.dart';
import '../edit_task/edit_task.dart';

class TaskScreenDetails extends StatefulWidget {
  Tasks tasks;
  TaskScreenDetails({super.key, required this.tasks});

  @override
  State<TaskScreenDetails> createState() => _TaskScreenDetailsState();
}

class _TaskScreenDetailsState extends State<TaskScreenDetails> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, EditTask.routeName);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Slidable(
          startActionPane: ActionPane(
            extentRatio: 0.25,
            motion: const ScrollMotion(),
            children:[
              SlidableAction(
              borderRadius: const BorderRadius.only(
                  topLeft:Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
                onPressed: (context){
                    AppFirebase.deleteTask(widget.tasks).timeout(const Duration(milliseconds: 500),
                      onTimeout: (){
                       print('deleted successful');
                      });
                    provider.getAllTasksFromFireStore();
                },
                backgroundColor: AppColors.redColor,
                foregroundColor: AppColors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],

          ),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            height: 90,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20))
            ),
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  color: AppColors.primaryColor,
                  width: 4,
                ),
                const SizedBox(width: 25,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.tasks.title ??'',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppThemes.titleText.copyWith(color: AppColors.primaryColor, fontSize: 25),
                      ),
                      const SizedBox(height: 3,),
                      Text(
                        widget.tasks.description ??'',
                        style: AppThemes.regularText.copyWith(fontSize: 15),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                      backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),

                    ),
                    onPressed: (){}, child: const Icon(Icons.check, size: 30,))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
