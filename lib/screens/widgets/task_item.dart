import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_codsoft/models/task_model.dart';
import 'package:todo_codsoft/screens/edit_task.dart';
import 'package:todo_codsoft/shared/network/firebase_function.dart';
import 'package:todo_codsoft/styles/app_colors.dart';

class TaskItem extends StatelessWidget {
  TaskModel tasks;

  TaskItem(this.tasks);

  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            FirebaseFunction.deleteTask(tasks.id);
          },
          backgroundColor: Color(0xFFFE4A49),
          icon: Icons.delete,
          label: 'Delete',
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        SlidableAction(
          onPressed: (context) {
            Navigator.pushNamed(context, EditTask.routeName, arguments: tasks);
          },
          backgroundColor: AppColors.blueColor,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Edit',
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 22, top: 15, bottom: 15),
                height: 110,
                width: 5,
                color:
                    tasks.status ? AppColors.greenColor : AppColors.blueColor,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Column(
                  children: [
                    Text(
                      tasks.title,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 22,
                          color: tasks.status
                              ? AppColors.greenColor
                              : AppColors.blueColor),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      tasks.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 15, color: Colors.black45),
                    ),
                  ],
                ),
              ),
              Spacer(),
              tasks.status
                  ? Text(
                      "Dine!",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.greenColor),
                    )
                  : InkWell(
                      onTap: () {
                        tasks.status = true;
                        FirebaseFunction.updateTask(tasks.id, tasks);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 12),
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        decoration: BoxDecoration(
                            color: AppColors.blueColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.done_all_sharp,
                          size: 30,
                          color: Colors.white,
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
