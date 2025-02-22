import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'February 2025',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Row(
          children: [
            MyNavigationButton(iconData: Icons.person),
            Gap(5),
            MyNavigationButton(iconData: Icons.arrow_back_ios_new),
            Gap(5),
            MyNavigationButton(iconData: Icons.arrow_forward_ios),
          ],
        ),
      ],
    );
  }
}

class MyTaskWidget extends StatefulWidget {
  final String task;
  final Function(String) onTaskEntered;

  const MyTaskWidget({
    super.key,
    required this.task,
    required this.onTaskEntered,
  });

  @override
  State<MyTaskWidget> createState() => _MyTaskWidgetState();
}

class _MyTaskWidgetState extends State<MyTaskWidget> {
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
              color: Theme.of(context).colorScheme.secondary, width: 1),
        ),
      ),
      child: widget.task.isEmpty
          ? TextField(
              style: Theme.of(context).textTheme.bodyMedium,
              cursorWidth: 1,
              cursorHeight: 20,
              cursorColor: Theme.of(context).colorScheme.inversePrimary,
              decoration: null,
              onSubmitted: (newTask) {
                if (newTask.trim().isNotEmpty) {
                  widget.onTaskEntered(newTask.trim());
                }
              },
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.task,
                  style: isDone
                      ? TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 2,
                          decorationColor: Colors.grey,
                        )
                      : null,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isDone = !isDone;
                    });
                  },
                  child: Icon(
                    isDone
                        ? Icons.check_circle
                        : Icons.check_circle_outline_rounded,
                    size: 18,
                    color: isDone ? Colors.grey : Colors.white,
                  ),
                ),
              ],
            ),
    );
  }
}

class MyDateDayWidget extends StatelessWidget {
  final String date;
  final String day;

  const MyDateDayWidget({
    super.key,
    required this.date,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
              color: Theme.of(context).colorScheme.inversePrimary, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            date,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            day,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class MyNavigationButton extends StatelessWidget {
  final IconData iconData;
  const MyNavigationButton({
    super.key,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      decoration: ShapeDecoration(
        shape: CircleBorder(),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Icon(
        iconData,
        size: 16,
      ),
    );
  }
}
