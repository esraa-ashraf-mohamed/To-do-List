import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/screens/settings/settings.dart';
import 'package:todo_list/screens/tasks_screen/tasks_screen.dart';
import 'package:todo_list/utils/app_colors.dart';
import 'package:todo_list/utils/themes.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? title;
  String? description;
  int currentIndex = 0;
  DateTime selectedDate = DateTime.now();
  List tabs = [
    const TasksScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Text(
            'To Do List',
            style:AppThemes.appBarTitle ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.18,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
            side: BorderSide(
                color: AppColors.white,
                width: 4
            )
        ),
        backgroundColor: AppColors.primaryColor,
        onPressed: (){
          viewBottomSheet();
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ) ,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: BottomNavigationBar(
          onTap: (value){
            currentIndex = value;
            setState(() {});
          },
          currentIndex: currentIndex,
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list, size: 35,), label: 'tasks'),
            BottomNavigationBarItem(icon: Icon(Icons.settings_outlined, size: 35,), label: 'settings')
          ],
        ),
      ),
      body: tabs[currentIndex],
    );
  }

  void viewBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.45,
        margin: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15)
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Add new Task',
              style: AppThemes.titleText,
              textAlign: TextAlign.center,
            ),
            TextFormField(
              onChanged: (text){
                title = text;
              },
              decoration: InputDecoration(
                  hintText: 'enter your task',
                  hintStyle: AppThemes.regularText
              ),
            ),
            TextFormField(
              onChanged: (text){
                description = text;
              },
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
                    backgroundColor: MaterialStateColor.resolveWith((states) => AppColors.primaryColor)
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text(
                  'Add',
                  style: AppThemes.appBarTitle,
                )
            )
          ],
        ),
      ),
    );
  }
}
