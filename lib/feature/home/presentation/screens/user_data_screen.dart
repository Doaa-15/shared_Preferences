import 'package:flutter/material.dart';
import 'package:shared_app/core/theme/color.dart';
import 'package:shared_app/feature/home/presentation/views/user_data_body.dart';


class SharedScreen extends StatelessWidget {
  const SharedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SharedBody(),
    );
  }
}