import 'package:book_app/firebase_options.dart';
import 'package:book_app/presentation/helpers/app_colors.dart';
import 'package:book_app/presentation/pages/book_page/book_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'List Book',
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: saffron,
            background: backgroundColor,
            brightness: Brightness.dark,
          ),
        ),
        home: const BookPage());
  }
}
