import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/models/task_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tasks = <TaskModel>[];

  var _taskNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset('assets/images/logo_ioasys.png'),
            ),
            Text('Lista de tarefas'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 6.0),
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _taskNameController,
                      decoration: InputDecoration(
                        labelText: 'Nova tarefa',
                        hintText: 'Digite o nome da tarefa',
                        labelStyle:
                            TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      var nameTask = _taskNameController.text;

                      tasks.add(TaskModel(nameTask));
                      _taskNameController.clear();
                      setState(() {});
                    },
                    child: Text(
                      'ADD',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    var task = tasks[index];
                    return Dismissible(
                      onDismissed: (value) {
                        tasks.removeAt(index);
                      },
                      direction: DismissDirection.startToEnd,
                      background: Container(
                        color: Theme.of(context).disabledColor,
                        padding: EdgeInsets.only(left: 16),
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      key: UniqueKey(),
                      child: Card(
                        child: CheckboxListTile(
                          title: Text(task.title),
                          value: task.isCompleted,
                          activeColor: Theme.of(context).primaryColor,
                          secondary: Icon(
                            task.isCompleted ? Icons.check_circle : Icons.error,
                            color: Theme.of(context).primaryColor,
                          ),
                          onChanged: (value) {
                            tasks[index].isCompleted = value!;

                            setState(() {});
                          },
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
