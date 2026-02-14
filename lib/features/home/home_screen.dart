import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskaty_app/core/widgets/app_constant.dart';
import 'package:taskaty_app/features/auth/models/user_model.dart';
import 'package:taskaty_app/features/home/add_task_row.dart';
import 'package:taskaty_app/features/home/home_app_bar.dart';
import 'package:taskaty_app/features/home/widget/tasks_list_view.dart';

import '../add_task/add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var userData = Hive.box<UserModel>(AppConstants.userBox).getAt(0);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            children: [
              if (userData != null) HomeAppBar(userData: userData),
              SizedBox(height: 20.h),
              AddTaskRow(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddTaskScreen()),
                  );
                  setState(() {});
                },
              ),
              SizedBox(height: 20.h),
              TasksListView(),
            ],
          ),
        ),
      ),
    );
  }
}
