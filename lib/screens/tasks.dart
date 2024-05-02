import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';

import '../model/task_model.dart';
import '../shared/network/firebase/firebase_fuction.dart';
import '../widgets/task_item.dart';

class TaskTab extends StatefulWidget {
  const TaskTab({Key? key}) : super(key: key);

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  DateTime data = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: Color(0xff5D9CEC),
              height: 113,
              selectedTextColor: Colors.white,
              onDateChange: (newdate) {
                // New date selected
                setState(() {
                  data = newdate;
                });
              },
            ),
            StreamBuilder(
              stream: FireBaseFunction.getTaskFirestore(data),
              builder: (context, snapshot) {
                List<TaskModel> tasks =
                    snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
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
        ),
      ),
    );
  }
}
