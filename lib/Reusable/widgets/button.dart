import 'package:flutter/material.dart';
import 'package:shared_app/core/theme/color.dart';

class Button extends StatelessWidget {
   final String button_name;
  final VoidCallback onPressed;

  const Button({super.key, required this.button_name, required this.onPressed});
 

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(400, 50),
                backgroundColor: AppColor.black,
              ),
              onPressed: onPressed,

              child:Text(button_name,style: TextStyle(color: AppColor.white),),
            );
  }
}