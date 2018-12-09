import 'package:flutter/material.dart';
import 'package:flutter_app1/data/data.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app1/model/todo.dart';

class TodoDetails extends StatefulWidget {
  final String todoAction;
  final Todo todo;

  TodoDetails(this.todoAction, this.todo);

  @override
  TodoDetailsState createState() {
    return new TodoDetailsState(todo);
  }
}

class TodoDetailsState extends State<TodoDetails> {
  Todo todo;

  TodoDetailsState(this.todo);

  final priorities = ['High', 'Medium', 'Low'];
  String priority = 'Not set';
  Data data = Data();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = todo.title;
    descriptionController.text = todo.description;
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${widget.todoAction} a Todo'),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
              child: TextField(
                controller: titleController,
                style: textStyle,
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                onChanged: (value) => updateTitle(value),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 15.0, bottom: 15.0, left: 10.0, right: 10.0),
              child: TextField(
                controller: descriptionController,
                style: textStyle,
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
                onChanged: (value) => updateDescription(value),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Center(
                child: DropdownButton<String>(
                  items: priorities.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  style: textStyle,
                  value: retrivePriority(todo.priority),
                  onChanged: (value) => updatePrioriy(value),
                  hint: Text('Priority'),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                  onPressed: () => save(),
                  color: Colors.green,
                  padding: EdgeInsets.all(10.0),
                ),
                RaisedButton(
                  child: Text(
                    'Delete',
                    style: TextStyle(color: Colors.white, fontSize: 24.0),
                  ),
                  onPressed: () => delete(),
                  color: Colors.red,
                  padding: EdgeInsets.all(10.0),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ],
        ),
      ),
    );
  }

  void save() {
    todo.date = DateFormat().add_yMd().format(DateTime.now());
    if (todo.id != null) {
      data.updateTodo(todo).then((result) {
        showSaveSuccess(context);
      });
    } else {
      if (todo.title == '' || todo.priority == -1) {
        showSaveError(context);
      } else {
        data.insertTodo(todo).then((result) {
          showSaveSuccess(context);
        });
      }
    }
  }

  void delete() {
    if (todo.id == null) {
      return;
    } else {
      data.deleteTodo(todo.id).then((result) {
        showDeleteSuccess(context);
      });
    }
  }

  void showSaveSuccess(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      title: Text('Save'),
      content: Text('ToDo saved'),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  void showDeleteSuccess(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      title: Text('Delete'),
      content: Text('ToDo deleted'),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  void showSaveError(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      title: Text('Error'),
      content: Text('Please enter title and select priority.'),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  void updatePrioriy(String value) {
    switch (value) {
      case 'High':
        todo.priority = 1;
        break;
      case 'Medium':
        todo.priority = 2;
        break;
      case 'Low':
        todo.priority = 3;
        break;
      default:
        todo.priority = 3;
        break;
    }
    setState(() {
      priority = value;
    });
  }

  String retrivePriority(int value) {
    if (value < 0 || value > priorities.length) {
      return null;
    }
    return priorities[value - 1];
  }

  void updateTitle(String value) => todo.title = titleController.text;

  void updateDescription(String value) =>
      todo.description = descriptionController.text;
}
