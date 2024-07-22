import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:todo_codsoft/models/task_model.dart';
import 'package:todo_codsoft/styles/app_colors.dart';

class EditTask extends StatefulWidget {
  static const String routeName = "edit";

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  var formkey=GlobalKey<FormState>();

   TextEditingController? titleController;

   TextEditingController? decController;

  @override
  Widget build(BuildContext context) {
    TaskModel task =ModalRoute.of(context)?.settings.arguments as TaskModel;
    if(titleController==null ||decController==null){
      titleController=TextEditingController(text: task.title);
      decController=TextEditingController(text: task.description);

    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To Do List ",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 50,right: 50,top: 20),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          width: double.infinity,
          height: 480,
          child: Form(
            key: formkey,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Edit Task",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "This is title",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextFormField(
                  controller: titleController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your title";
                    }
                    return null;
                  },
                  style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.normal,
                      fontSize: 17),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "This is descripthion",
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                TextFormField(
                  controller: decController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your description";
                    }
                    return null;
                  },
                  style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.normal,
                      fontSize: 17),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent))),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Select Date",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    "${task.date.toString().substring(0,10)}"
                      /*  "${task.date.toString().substring(3,5)}-"
                        "${task.date.toString().substring(6,10)}"*/,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.black54),
                  ),
                ),
                SizedBox(height: 30,),
                Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8, bottom: 20),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            fixedSize: Size(300, 50),
                            backgroundColor: AppColors.blueColor),
                        child: Text(
                          "Save Changes",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void initState(){
    super.initState;
      }

  @override
  void dispose() {
    super.dispose();
    titleController!.dispose();
    decController!.dispose();
  }
}
