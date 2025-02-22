import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final items = [
    MyDateDayWidget(date: 'Feb 17', day: 'Mon'),
    MyTaskWidget(task: ''),
    MyDateDayWidget(date: 'Feb 18', day: 'Tue'),
    MyTaskWidget(task: ''),
    MyDateDayWidget(date: 'Feb 19', day: 'Wed'),
    MyTaskWidget(task: ''),
    MyDateDayWidget(date: 'Feb 20', day: 'Thu'),
    MyTaskWidget(task: ''),
    MyDateDayWidget(date: 'Feb 21', day: 'Fri'),
    MyTaskWidget(task: ''),
    MyDateDayWidget(date: 'Feb 22', day: 'Sat'),
    MyTaskWidget(task: ''),
    MyDateDayWidget(date: 'Feb 23', day: 'Sun'),
    MyTaskWidget(task: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // APP BAR
              MyAppBar(),
              Divider(
                height: 30,
                color: Theme.of(context).colorScheme.primary,
              ),

              Expanded(
                  child: ReorderableListView.builder(
                itemCount: items.length,
                buildDefaultDragHandles:
                    false, // Removes the trailing reorder icon
                itemBuilder: (context, index) {
                  final item = items[index];

                  if (item is MyTaskWidget) {
                    return ReorderableDragStartListener(
                      key: ValueKey(index), // Unique key
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
                  if (newIndex > oldIndex) newIndex--; // Adjust for index shift
                  final item = items.removeAt(oldIndex);
                  items.insert(newIndex, item);
                },
              )),
              // MAIN PART OF APP
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
          'Feb 2025',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Row(
          children: [
            MyNavigationButton(iconData: Icons.person),
            Gap(5),
            MyNavigationButton(iconData: Icons.arrow_back),
            Gap(5),
            MyNavigationButton(iconData: Icons.arrow_forward),
          ],
        ),
      ],
    );
  }
}

class MyTaskWidget extends StatelessWidget {
  final String task;

  const MyTaskWidget({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 1),
        ),
      ),
      child: Text(task),
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
              color: Theme.of(context).colorScheme.primary, width: 1),
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
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Icon(iconData),
    );
  }
}
