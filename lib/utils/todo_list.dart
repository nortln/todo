import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDolist extends StatelessWidget {
  const ToDolist({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 0,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              backgroundColor: const Color.fromARGB(31, 182, 181, 181),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                checkColor: Colors.white,
                activeColor: Colors.black45,
                side: const BorderSide(color: Colors.black45),
              ),
              Text(
                taskName,
                style: TextStyle(
                  color: Color.fromARGB(237, 0, 0, 0),
                  fontSize: 18,
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.black45,
                  decorationThickness: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
