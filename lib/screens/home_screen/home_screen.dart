import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? title;
  String? description;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Text(
            'To Do List',
            style: TextStyle(color: AppColors.white, fontSize: 22, fontWeight: FontWeight.bold)),
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
          backgroundColor: Colors.transparent,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list, size: 35,), label: 'tasks'),
            BottomNavigationBarItem(icon: Icon(Icons.settings_outlined, size: 35,), label: 'settings')
          ],
        ),
      ),
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
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColorLight
                ),
                textAlign: TextAlign.center,
              ),
              TextFormField(
                onChanged: (text){
                  title = text;
                },
                decoration: InputDecoration(
                  hintText: 'enter your task',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: AppColors.grayColorLight
                  )
                ),
              ),
              TextFormField(
                onChanged: (text){
                  description = text;
                },
                decoration: InputDecoration(
                  hintText: 'enter your task',
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: AppColors.grayColorLight
                    )
                ),
              ),
              Text(
                  'Select date',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: AppColors.blackColorLight
                  )
              ),
              InkWell(
                child: Text(
                    DateFormat.yMd().format(selectedDate).toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: AppColors.grayColorLight
                    ),
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
                  onPressed: (){}, 
                  child: Text(
                      'Add',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.white
                    ),
                  )
              )
            ],
          ),
        ),
    );
  }
}
