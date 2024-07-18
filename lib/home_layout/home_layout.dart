import 'package:flutter/material.dart';
import 'package:todo_codsoft/screens/settings.dart';
import 'package:todo_codsoft/screens/tasks.dart';
import 'package:todo_codsoft/styles/app_colors.dart';

import '../screens/widgets/add_task_bottom_sheet.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "home";

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;
  List<Widget> tabs = [Tasks(), Settings()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Do List ',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
            side: BorderSide(
          color: Colors.white,
          width: 3,
        )),
        backgroundColor: AppColors.blueColor,
        onPressed: () {
          addTaskSheet();
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          iconSize: 22,
          elevation: 0,
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
          ],
        ),
      ),
      body: tabs[index],
    );
  }
  void addTaskSheet(){
    showModalBottomSheet(context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding:  EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom
        ),
        child: AddTaskBottomSheet(),
      ),);
  }
}
