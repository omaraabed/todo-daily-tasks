import 'package:flutter/material.dart';


import '../screens/tasks.dart';
import '../widgets/add_task_bottom_sheet.dart';


class HomeLayout extends StatefulWidget {
  static const String routeName = 'HomeLayout';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent
          ),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50)
          )
        ),
        elevation: 0,
        backgroundColor: Color(0xff5D9CEC),
        toolbarHeight: 120,
        title: Text('TO Do List',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FloatingActionButton(
          backgroundColor: Color(0xff5D9CEC),
          shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 4)),
          onPressed: () {
            ShowAddTaskSheet();
          },
          child: Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      body: tabs[index],
    );
  }

  List<Widget> tabs = [TaskTab()];

  void ShowAddTaskSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: AddTaskBTN(),
      ),
    );
  }
}
