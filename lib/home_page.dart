import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweek_clone/components/my_app_bar.dart';
import 'package:tweek_clone/components/my_date_day_widget.dart';
import 'package:tweek_clone/riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(tasksProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              MyAppBar(),
              MyDateDayWidget(date: 'Feb 23', day: 'Sun'),
              Expanded(
                child: ReorderableListView.builder(
                  itemCount: items.length,
                  buildDefaultDragHandles: false,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    if (item.task.isNotEmpty) {
                      return ReorderableDragStartListener(
                        key: ValueKey(index),
                        index: index,
                        child: item,
                      );
                    }

                    return Container(
                      key: ValueKey(index),
                      child: item,
                    );
                  },
                  onReorder: (int oldIndex, int newIndex) {
                    if (oldIndex == items.length - 1) {
                      return;
                    }
                    if (newIndex > oldIndex) newIndex--;

                    if (newIndex >= items.length - 1) {
                      newIndex = items.length - 2;
                    }

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
