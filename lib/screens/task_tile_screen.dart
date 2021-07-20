import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallBack;
  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
          value: isChecked,
          onChanged: (newValue) {
            checkboxCallBack(newValue);
          }),
    );
  }
}


//  (bool checkboxState) {
//             setState(() {
//               isChecked = checkboxState;
//             });
//           },


