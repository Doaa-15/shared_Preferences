import 'package:flutter/material.dart';
import 'package:shared_app/feature/home/presentation/screens/user_data_screen.dart';


class SharedPreferences extends StatelessWidget {
  const SharedPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SharedScreen(),
    );
  }
}