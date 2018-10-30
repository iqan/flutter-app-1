import 'package:flutter/material.dart';
import 'package:flutter_app1/data/data.dart';
import 'package:flutter_app1/model/todo.dart';
import 'package:flutter_app1/screens/todo/tododetails.dart';

class TodoList extends StatefulWidget {
  @override
  TodoListState createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  Data data = Data();
  List<Todo> todos = List<Todo>();
  int count = 0;

  @override
  Widget build(BuildContext context) {
    getTodos();
    return Material(
      child: Scaffold(
        body: todoListItems(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TodoDetails('Add', Todo('', -1, ''))));
          },
          tooltip: 'Add new To-Do',
        )
      )
    );
  }

  void getTodos() {
    data.initializeDb().then((result) {
      data.getTodos().then((result) {
        List<Todo> list = List<Todo>();
        int todosCount = result.length;
        for (var i = 0; i < todosCount; i++) {
          list.add(Todo.fromObject(result[i]));
        }
        setState(() {
          todos = list;
          count = todosCount;
        });
      });
    });
  }

  ListView todoListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        Todo current = todos[position];
        return Card(
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: getColor(current),
              child: Text(current.priority.toString()),
            ),
            title: Text(current.title),
            subtitle: Text(current.date),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TodoDetails('Update', current)));
            },
          ),
        );
      },
    );
  }

  Color getColor(Todo todo) {
    switch (todo.priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;
      default:
        return Colors.green;
    }
  }
}
