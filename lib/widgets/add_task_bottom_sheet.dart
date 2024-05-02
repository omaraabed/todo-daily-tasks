import 'package:flutter/material.dart';

import '../model/task_model.dart';
import '../shared/network/firebase/firebase_fuction.dart';


class AddTaskBTN extends StatefulWidget {
  @override
  State<AddTaskBTN> createState() => _AddTaskBTNState();
}

class _AddTaskBTNState extends State<AddTaskBTN> {
  var formKay = GlobalKey<FormState>();
  var date = DateTime.now();
  var titleControl = TextEditingController();
  var descriptionControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKay,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Add New Task',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: titleControl,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your Title ';
                  }
                },
                textInputAction: TextInputAction.next,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                    fillColor: Colors.red,
                    label: Text(
                      ' Task Title',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 17, color: Colors.black54),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.lightBlue)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.lightBlue))),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: descriptionControl,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your Task Description ';
                  }
                },
                maxLines: 1,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                    label: Text(
                      ' Task Description',
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 17, color: Colors.black54),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.lightBlue)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.lightBlue))),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Select Date',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 20, color: Colors.black),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 5.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        chooseDate();
                      },
                      child: Text(date.toString().substring(0, 10),
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 18,
                          )),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        if (formKay.currentState!.validate()) {
                          TaskModel task = TaskModel(
                              title: titleControl.text,
                              date: date.millisecondsSinceEpoch,
                              description: descriptionControl.text,
                              statue: false);
                          FireBaseFunction.addTaskToFirestore(task)
                              .then((value) {
                            Navigator.pop(context);
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.only(
                              top: 8, bottom: 8, right: 7, left: 7)),
                      child: Text(
                        'Add Task',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void chooseDate() async {
    DateTime? selected = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365 * 100)));
    if (selected != null) {
      date = DateUtils.dateOnly(selected);
      setState(() {});
    }
  }
}
