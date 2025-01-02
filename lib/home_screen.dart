import 'package:flutter/material.dart';
import 'package:todo/utlis/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();

   List todoList = [
    ['Learn Flutter', false],
    ['Dark mode in Flutter', false],
  ];

  void checkBoxChanged( int index){
   setState(() {
      todoList[index][1] = !todoList[index][1];
      _controller.clear();
   });

  }
  void saveNewTask(){
    setState(() {
      todoList.add([_controller.text, false]);
    });
  }
  void delateTask(int index){
    setState(() {
      todoList.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade400,
      appBar: AppBar(
        title: const Center(
          child: Text("Simple Todo"),
        ),
        backgroundColor: Colors.deepPurple.shade200,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return TodoList(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) => checkBoxChanged(index),
            deleteFunction: (contex) => delateTask(index) ,
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextField(
                  controller: _controller,
        
                  decoration: InputDecoration(
                    hintText: 'Add Sadik',
                    filled: true,
                    fillColor: Colors.deepPurple.shade200,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(15.0)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                      ),
                      borderRadius: BorderRadius.circular(15.0)
                    )
                  ),
                ),
              ),
        
            ),
            FloatingActionButton(
              onPressed: saveNewTask,
              child:const Icon(Icons.add),
              ),
          ],
        ),
      ),
    );
  }
}
