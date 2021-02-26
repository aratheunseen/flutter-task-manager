import 'package:flutter/material.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  Widget _buildTask(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: <Widget>[
          Divider(),
          ListTile(
            title: Text("Deleted Task Title - ${index}"),
            subtitle: Text("Feb 28, 2021 - 12:00PM • High"),
            trailing: IconButton(
              icon: Icon(
                Icons.restore,
                color: Colors.redAccent,
              ),
              onPressed: () {},
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
          backgroundColor: Color.fromRGBO(250, 250, 250, 1),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.redAccent,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Row(children: [
            Text(
              "History",
              style: const TextStyle(
                color: Colors.redAccent,
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ]),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.delete_forever,
                  color: Colors.redAccent,
                ),
                onPressed: () {}),
          ],
          centerTitle: false,
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: 15,
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
                          'You have completed 14 tasks',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
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
