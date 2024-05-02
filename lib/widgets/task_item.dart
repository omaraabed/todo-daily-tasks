import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/task_model.dart';
import '../shared/network/firebase/firebase_fuction.dart';


class TaskItem extends StatelessWidget {
  TaskModel task;

  TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            FireBaseFunction.delete(task.id);
          },
          label: 'Delete',
          backgroundColor: Colors.red,
          icon: Icons.delete,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
        ),
        SlidableAction(
          onPressed: (context) {},
          backgroundColor: Colors.blue,
          icon: Icons.edit,
          label: 'edit',
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.transparent)),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 100,
                width: 5,
                color: task.statue ? Color(0xff61E757) : Color(0xff5D9CEC),
                margin: EdgeInsets.only(left: 20, top: 10, bottom: 10),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .05,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title,
                      style: TextStyle(
                          color: task.statue
                              ? Color(0xff61E757)
                              : Color(0xff5D9CEC),
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  Text(task.description,
                      style: TextStyle(
                          color: task.statue ? Color(0xff61E757) : Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w400)),
                  // Spacer(),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: task.statue
                    ? Text(
                        'Done!',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff61E757)),
                      )
                    : InkWell(
                        onTap: () {
                          task.statue = true;
                          FireBaseFunction.update(task.id, task);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff5D9CEC),
                              borderRadius: BorderRadius.circular(20)),
                          width: 60,
                          height: 30,
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
