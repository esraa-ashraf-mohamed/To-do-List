import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/providers/app_provider.dart';
import 'package:todo_list/screens/tasks_screen/task_screen_details.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {

  final EasyInfiniteDateTimelineController controller =
  EasyInfiniteDateTimelineController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    if(provider.tasksList.isEmpty){
      provider.getAllTasksFromFireStore();
    }
    return Column(
      children: [
        EasyInfiniteDateTimeLine(
          controller: controller,
          firstDate: DateTime.now().subtract(const Duration(days: (365))),
          lastDate: DateTime.now().add(const Duration(days: (365 * 5))),
          onDateChange: (selectedDate) {
            provider.changeDate(selectedDate);
          },
          focusDate: provider.dateTime,
        ),
        Expanded(
          child: ListView.builder(
              itemBuilder: (context, index) {
                return TaskScreenDetails(tasks: provider.tasksList[index],);
              },
              itemCount: provider.tasksList.length,
          ),
        ),
      ],
    );
  }

}
