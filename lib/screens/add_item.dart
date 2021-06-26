import 'package:achieve/constants.dart';
import 'package:flutter/material.dart';
import 'package:achieve/components/data_access.dart';
import 'package:achieve/components/todo.dart';

class AddTodoItemScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AddTodoItemScreenState();
}

class _AddTodoItemScreenState extends State<AddTodoItemScreen> {
  final _todoNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Scaffold(
          backgroundColor: Color(0xff17223b),
          appBar: AppBar(
            toolbarHeight: 60,
            title: Text("Set a New Goal"),
            backgroundColor: Color(0xff0f1623),
          ),
          body: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    style: kHintText,
                    decoration: InputDecoration(
                        labelText: "Write your goal...", labelStyle: kHintText),
                    controller: _todoNameController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        elevation: 5,
                        color: Color(0xff6b778d),
                        child: Text(
                          "Cancel",
                          style: kButtonText,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      RaisedButton(
                        elevation: 5,
                        color: Color(0xff6b778d),
                        child: Text(
                          "Save",
                          style: kButtonText,
                        ),
                        onPressed: () {
                          DataAccess().insertTodo(
                              TodoItem(name: _todoNameController.text));
                          Navigator.pop(context);
                        },
                      )
                    ],
                  )
                ],
              ))),
    );
  }
}
