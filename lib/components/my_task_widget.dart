import 'package:flutter/material.dart';

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
