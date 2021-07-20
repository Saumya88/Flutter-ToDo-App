import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/screens/task.dart';
import 'package:todo_app/screens/task_lists_screen.dart';
import 'package:todo_app/utilities/global_constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TasksScreen extends StatefulWidget {
  static const String id = "taskScreen";
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(isDone: false, name: "Study Java"),
    Task(isDone: false, name: "Eat a human being"),
    Task(isDone: false, name: "Kill a doll"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            backgroundColor: kBlueColor,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => AddTaskScreen(
                  addTaskCallback: (newTaskTitle) {
                    print(newTaskTitle);
                    setState(() {
                      tasks.add(Task(isDone: false, name: newTaskTitle));
                    });
                    Navigator.pop(context);
                  },
                ),
              );
            },
            child: Icon(Icons.add),
          ),
        ),
        backgroundColor: kBlueColor,
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kFadedBlueColor,
              ),
              margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: kFadedBlueColor,
                          child: ClipOval(
                            child: Image.asset('assets/images/todo.jpg'),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'My ToDo App',
                              textStyle: TextStyle(
                                  color: kBlueColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                  fontStyle: FontStyle.normal),
                              speed: const Duration(milliseconds: 180),
                            ),
                          ],
                          totalRepeatCount: 2,
                          pause: const Duration(milliseconds: 1000),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 15,
                    thickness: 3,
                    color: kBlueColor,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 10, 10),
                    child: Text(
                      "${tasks.length} Tasks",
                      style: TextStyle(
                          color: kPeachColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          fontStyle: FontStyle.normal),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                height: double.infinity,
                decoration: BoxDecoration(
                  color: kFadedBlueColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: TasksList(tasks: tasks),
              ),
            )
          ],
        ),
      ),
    );
  }
}
