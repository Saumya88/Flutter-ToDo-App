import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/utilities/global_constants.dart';

String? newtaskTitle;

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;
  AddTaskScreen({required this.addTaskCallback});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: kFadedBlueColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Add Task",
              style: TextStyle(
                  fontSize: 30.0,
                  color: kBlueColor,
                  fontWeight: FontWeight.w500),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newtaskTitle = newText;
                print("inside text field");
                print(newtaskTitle);
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                print("inside text button");
                print(newtaskTitle);
                addTaskCallback(newtaskTitle);
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(132, 8, 134, 8),
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              style: TextButton.styleFrom(
                primary: kFadedBlueColor,
                backgroundColor: kBlueColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
