import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildTask(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: <Widget>[
          Divider(),
          ListTile(
            title: Text("Demo Task Title"),
            subtitle: Text("Feb 28, 2021 - 12:00PM • High"),
            trailing: Checkbox(
              onChanged: (value) {
                print(value);
              },
              activeColor: Colors.grey,
              value: true,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Task Manager",
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 22.0,
              fontWeight: FontWeight.normal,
              letterSpacing: -1.2,
            ),
          ),
          centerTitle: false,
          shadowColor: Colors.transparent,
          actions: [
            Container(
              margin: const EdgeInsets.all(0),
              child: IconButton(
                  icon: Icon(Icons.history),
                  iconSize: 25.0,
                  color: Colors.grey,
                  onPressed: () => print("Navigate to History Screen")),
            ),
            Container(
              margin: const EdgeInsets.all(6.0),
              child: IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  iconSize: 25.0,
                  color: Colors.grey,
                  onPressed: () => print("Navigate to Add Screen")),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Column(
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
                          'You have 16 pending task out of 35',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }
              return _buildTask(index);
            }));
  }
}
