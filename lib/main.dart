import 'package:flutter/material.dart';
import 'package:todo_app/screens/splash_screen.dart';
import 'package:todo_app/screens/tasks_screen.dart';
import 'package:todo_app/utilities/global_constants.dart';
import 'package:todo_app/utilities/size_configuration.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                //fontFamily: kFontFamily,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                backgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  color: Colors.white,
                  elevation: 0,
                ),
              ),
              initialRoute: Splash.id,
              routes: {
                TasksScreen.id: (context) => TasksScreen(),
                Splash.id: (context) => Splash(
                      backgroundColor: const [
                        kPeachColor,
                        kFadedLavenderColor,
                        kLavenderColor,
                        kFadedLavenderColor,
                        kPeachColor
                      ],
                      duration: 4,
                      nextScreenPath: TasksScreen.id,
                    ),
              },
            );
          },
        );
      },
    );
  }
}
