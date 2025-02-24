import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tweek_clone/components/my_task_widget.dart';

final tasksProvider = StateProvider<List>(
  (ref) => [
    MyTaskWidget(),
  ],
);
