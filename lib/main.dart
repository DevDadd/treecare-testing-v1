import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testtree/core/contains.dart';
import 'package:testtree/cubit/theme_cubit.dart';
import 'package:testtree/cubit/theme_state.dart';
import 'package:testtree/di.dart';
import 'package:testtree/firebase_options.dart';
import 'package:testtree/router/go_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory(
            (await getApplicationDocumentsDirectory()).path,
          ),
  );

  setup();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Gemini.init(apiKey: Contains.Gemini_Api_Key);

  runApp(
    BlocProvider(create: (_) => getIt<ThemeCubit>(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRoutes().router,
        );
      },
    );
  }
}
