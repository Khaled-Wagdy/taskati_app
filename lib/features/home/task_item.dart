import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskaty_app/features/home/models/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: task.color,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              spacing: 10.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                Text(
                  task.title,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "${task.startTime} | ${task.endTime}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  task.description,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Container(color: Colors.grey, width: 2.w, height: 100.h),
          SizedBox(width: 10.w),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              task.statusText,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
