import 'package:flutter/material.dart';
import 'package:tweek_clone/components/my_app_bar.dart';
import 'package:tweek_clone/components/my_date_day_widget.dart';
import 'package:tweek_clone/components/my_task_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<dynamic> items = [
    MyDateDayWidget(date: 'Feb 17', day: 'Mon'),
    MyTaskWidget(task: '', onTaskEntered: (_) {}), // Empty task for this day
    MyDateDayWidget(date: 'Feb 18', day: 'Tue'),
    MyTaskWidget(task: '', onTaskEntered: (_) {}), // Empty task for this day
    MyDateDayWidget(date: 'Feb 19', day: 'Wed'),
    MyTaskWidget(task: '', onTaskEntered: (_) {}), // Empty task for this day
    MyDateDayWidget(date: 'Feb 20', day: 'Thu'),
    MyTaskWidget(task: '', onTaskEntered: (_) {}), // Empty task for this day
    MyDateDayWidget(date: 'Feb 21', day: 'Fri'),
    MyTaskWidget(task: '', onTaskEntered: (_) {}), // Empty task for this day
    MyDateDayWidget(date: 'Feb 22', day: 'Sat'),
    MyTaskWidget(task: '', onTaskEntered: (_) {}), // Empty task for this day
    MyDateDayWidget(date: 'Feb 23', day: 'Sun'),
    MyTaskWidget(task: '', onTaskEntered: (_) {}), // Empty task for this day
  ];

  void _addTask(String newTask, int index) {
    setState(() {
      items[index] = MyTaskWidget(
        task: newTask,
        onTaskEntered: (t) {}, // No callback needed for filled tasks
      );

      int insertIndex = index + 1;

      while (insertIndex < items.length && items[insertIndex] is MyTaskWidget) {
        insertIndex++; // Move past existing tasks
      }

      items.insert(
          insertIndex,
          MyTaskWidget(
              task: '', onTaskEntered: (t) => _addTask(t, insertIndex)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              MyAppBar(),
              Expanded(
                child: ReorderableListView.builder(
                  itemCount: items.length,
                  buildDefaultDragHandles: false,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    if (item is MyTaskWidget) {
                      if (item.task.isNotEmpty) {
                        return ReorderableDragStartListener(
                          key: ValueKey(index),
                          index: index,
                          child: MyTaskWidget(
                            task: item.task,
                            onTaskEntered: (newTask) =>
                                _addTask(newTask, index),
                          ),
                        );
                      } else {
                        return Container(
                          key: ValueKey(index),
                          child: MyTaskWidget(
                            task: item.task,
                            onTaskEntered: (newTask) =>
                                _addTask(newTask, index),
                          ),
                        );
                      }
                    }

                    return Container(
                      key: ValueKey(index),
                      child: item,
                    );
                  },
                  onReorder: (int oldIndex, int newIndex) {
                    if (newIndex > oldIndex) newIndex--;
                    final item = items.removeAt(oldIndex);
                    items.insert(newIndex, item);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
