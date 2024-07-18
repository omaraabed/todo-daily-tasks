import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:todo_codsoft/models/task_model.dart';
import 'package:todo_codsoft/screens/widgets/task_item.dart';
import 'package:todo_codsoft/shared/network/firebase_function.dart';
import 'package:todo_codsoft/styles/app_colors.dart';

class Tasks extends StatefulWidget {
  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          height: 120,
          width: 70,
          selectionColor: Color(0xff5D9CEC),
          selectedTextColor: Colors.white,
          onDateChange: (newDate) {
            // New date selected
            setState(() {
              date = newDate;
            });
          },
        ),
        StreamBuilder(
          stream: FirebaseFunction.getTaskFromFirestore(date),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(
                color: Colors.white,
              ));
            }
            if (snapshot.hasError) {
              return Center(child: Text("Try Agian!!!!"));
            }
            List<TaskModel> tasks =
                snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return TaskItem(tasks[index]);
                },
                itemCount: tasks.length,
              ),
            );
          },
        )
      ],
    );
  }
}
