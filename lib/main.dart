import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskaty_app/core/widgets/app_constant.dart';
import 'package:taskaty_app/features/auth/models/user_model.dart';
import 'package:taskaty_app/taskati_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(UserModelAdapter());
  }

  if (!Hive.isBoxOpen(AppConstants.userBox)) {
    await Hive.openBox<UserModel>(AppConstants.userBox);
  }

  runApp(TaskatiApp());
}
