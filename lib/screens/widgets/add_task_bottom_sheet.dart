import 'package:flutter/material.dart';
import 'package:todo_codsoft/models/task_model.dart';
import 'package:todo_codsoft/shared/network/firebase_function.dart';
import 'package:todo_codsoft/styles/app_colors.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formkey = GlobalKey<FormState>();

  var Controller1 = TextEditingController();

  var Controller2 = TextEditingController();
  var selected = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Add New Task",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: Controller1,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 20),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your task";
                }
                return null;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text(
                  "Task Title",
                  style: TextStyle(fontSize: 17),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: AppColors.blueColor),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.black,
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 20),
              textInputAction: TextInputAction.newline,
              controller: Controller2,
              maxLines: 2,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your description";
                }
                return null;
              },
              decoration: InputDecoration(
                label: Text(
                  "Task Description ",
                  style: TextStyle(fontSize: 15),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: AppColors.blueColor),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.black,
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Select Date",
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                chooseDate();
              },
              child: Text(
                selected.toString().substring(0, 10),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.black54),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    TaskModel task = TaskModel(
                        title: Controller1.text,
                        description: Controller2.text,
                        date: selected.millisecondsSinceEpoch,
                        status: false);
                    FirebaseFunction.addTaskToFirestore(task).then((value) {
                      Navigator.pop(context);
                    },);
                  }
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: Size(100, 50),
                    backgroundColor: AppColors.blueColor),
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }

  void chooseDate() async {
    DateTime? selectDate = await showDatePicker(
        builder: (context, child) => Theme(
            data: Theme.of(context).copyWith(
                colorScheme: Theme.of(context).colorScheme!.copyWith(
                      primary: AppColors.blueColor,
                      onPrimary: Colors.white,
                    )),
            child: child!),
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365 * 100)));
    if (selectDate != null) {
      selected = DateUtils.dateOnly(selectDate);
      setState(() {});
    }
  }
}
