import 'package:flutter/material.dart';
import 'package:task_manager/helpers/database_helper.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/screens/add_task_screen.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

import 'home_screen.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  Future<List<Task>> _taskList;
  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');

  @override
  void initState() {
    super.initState();
    _updateTaskList();
  }

  _updateTaskList() {
    setState(() {
      _taskList = DatabaseHelper.instance.getTaskList();
    });
  }

  Widget _buildTask(Task task) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: <Widget>[
          if (task.status == 1)
            ListTile(
              title: Text(
                task.title,
                style: TextStyle(
                  fontSize: 18.0,
                  decoration: task.status == 1
                      ? TextDecoration.none
                      : TextDecoration.lineThrough,
                ),
              ),
              subtitle: Text(
                '${_dateFormatter.format(task.date)} • ${task.priority}',
                style: TextStyle(
                  fontSize: 15.0,
                  decoration: task.status == 1
                      ? TextDecoration.none
                      : TextDecoration.lineThrough,
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.restore_from_trash,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  task.status = 0;
                  DatabaseHelper.instance.updateTask(task);
                  Toast.show("Task reassigned", context,
                      duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                  _updateTaskList();
                },
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AddTaskScreen(
                    updateTaskList: _updateTaskList,
                    task: task,
                  ),
                ),
              ),
            ),
          // Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomeScreen()))),
        title: Row(children: [
          Text(
            'History',
            style: const TextStyle(
              color: Colors.redAccent,
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ]),
        // actions: [
        //   IconButton(
        //       icon: Icon(
        //         Icons.info_outline,
        //         color: Colors.black,
        //       ),
        //       onPressed: () {}),
        // ],
        centerTitle: false,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: _taskList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final int completedTaskCount = snapshot.data
              .where((Task task) => task.status == 1)
              .toList()
              .length;

          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 0.0),
            itemCount: 1 + snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color.fromRGBO(240, 240, 240, 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Center(
                          child: Text(
                            'You have completed [ $completedTaskCount ] tasks',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }
              return _buildTask(snapshot.data[index - 1]);
            },
          );
        },
      ),
    );
  }
}
