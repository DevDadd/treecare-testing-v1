import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testtree/cubit/file_cubit.dart';
import 'package:testtree/cubit/tree_cubit.dart'; // example 2nd cubit
import 'package:testtree/di.dart';
import 'package:testtree/feature/home/setting/views/google_login_page.dart';
import 'package:testtree/feature/home/setting/views/upload_page.dart';
import 'package:testtree/firebase_options.dart';
import 'package:testtree/router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRoutes().router,
    );
  }
}
