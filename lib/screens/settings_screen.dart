import 'package:flutter/material.dart';
import 'package:task_manager/helpers/database_helper.dart';
import 'home_screen.dart';
import 'stacked_icons.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

showAlertDialog(BuildContext context) async {

  // set up the buttons
  // ignore: deprecated_member_use
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed:  () {Navigator.pop(context);},
  );
  // ignore: deprecated_member_use
  Widget continueButton = FlatButton(
    child: Text("OK"),
    onPressed:  () {
      DatabaseHelper.instance.deleteAllTask();
      Toast.show("All data cleared", context,
        duration: Toast.LENGTH_LONG,
        gravity: Toast.BOTTOM);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => HomeScreen()));
      },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    content: Text("Would you like to clear all data? It cannot be undone."),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class _SettingsState extends State<Settings> {
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
            'Settings',
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 60.0, 25.0, 25.0),
        child: Container(
          width: double.infinity,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new StakedIcons(),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: new Text(
                      "Task Manager",
                      style: new TextStyle(fontSize: 20.0, color: Colors.grey),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5.0, left: 25.0, right: 20.0, bottom: 60.0),
                child: new Container(
                    alignment: Alignment.center,
                    child: new Text("Version: 3.0.0",
                        style:
                            new TextStyle(fontSize: 12.0, color: Colors.grey))),
              ),
              SizedBox(
                width: 1080,
                height: 1,
                child: const DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.black12),
                ),
              ),
              new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 40.0, right: 20.0, bottom: 30.0),
                        child: GestureDetector(
                          onTap: () {
                            showAlertDialog(context);
                          },
                          child: new Container(
                              alignment: Alignment.center,
                              height: 40.0,
                              decoration: new BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: new BorderRadius.circular(9.0)),
                              child: new Text("CLEAR ALL DATA",
                                  style: new TextStyle(
                                      fontSize: 15.0, color: Colors.white))),
                        ),
                      ),
                    ),
                  ]),
              SizedBox(
                width: 1080,
                height: 1,
                child: const DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.black12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 20.0),
                child: new Container(
                  alignment: Alignment.centerLeft,
                  height: 60.0,
                  child: InkWell(
                    child: new Text(
                      "Terms and Condition",
                      style: new TextStyle(
                          fontSize: 17.0,
                          color: Colors.brown,
                          backgroundColor: Colors.transparent),
                    ),
                    onTap: () => launch('https://bornomala-tech.web.app/policies'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 20.0),
                child: new Container(
                  alignment: Alignment.centerLeft,
                  height: 60.0,
                  child: InkWell(
                    child: new Text(
                      "Privacy Policy",
                      style: new TextStyle(
                          fontSize: 17.0,
                          color: Colors.brown,
                          backgroundColor: Colors.transparent),
                    ),
                    onTap: () =>
                        launch('https://bornomala-tech.web.app/policies'),
                  ),
                ),
              ),
              SizedBox(
                width: 1080,
                height: 1,
                child: const DecoratedBox(
                  decoration: const BoxDecoration(color: Colors.black12),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: new Text("Bornomala Technologies ",
                          style: new TextStyle(
                              fontSize: 15.0, color: Colors.black54)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
