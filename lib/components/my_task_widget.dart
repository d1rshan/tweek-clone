import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweek_clone/riverpod.dart';

class MyTaskWidget extends ConsumerWidget {
  final String task;
  final bool isDone;

  const MyTaskWidget({super.key, this.task = '', this.isDone = false});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
            width: 1,
          ),
        ),
      ),
      child: task.isEmpty
          ? TextField(
              style: Theme.of(context).textTheme.bodyMedium,
              cursorWidth: 1,
              cursorHeight: 20,
              cursorColor: Theme.of(context).colorScheme.inversePrimary,
              decoration: null,
              onSubmitted: (newTask) {
                ref.read(tasksProvider.notifier).update((state) {
                  List list = [...state];
                  list.removeLast();
                  list.add(MyTaskWidget(task: newTask));
                  list.add(MyTaskWidget());

                  return list;
                });
              },
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task,
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
                    // setState(() {
                    //   isDone = !isDone;
                    // });
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
