import 'dart:ffi' hide Size;
import 'package:shared_app/Reusable/widgets/button.dart';
import 'package:shared_app/core/utils/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:shared_app/core/theme/color.dart';

class SharedBody extends StatefulWidget {
  const SharedBody({super.key});

  @override
  State<SharedBody> createState() => _SharedBodyState();
}

class _SharedBodyState extends State<SharedBody> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String? name;
  int? age;
  @override

  void dispose() {
    namecontroller.dispose();
    ageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: formkey,
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: namecontroller,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "name is required";
                }
                return null;
              },
            ),
            TextFormField(
              controller: ageController,
              decoration: InputDecoration(
                labelText: "Age",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "age is required";
                }
                if (int.tryParse(value) == null) {
                  return "enter a valid number";
                }
                return null;
              },
            ),
            //save button
              Button(
        button_name: "Save",
        onPressed: () async {
                if (formkey.currentState!.validate()) {
                  await SharedPref.saveStringData("name", namecontroller.text);
                  await SharedPref.saveIntData(
                    "age",
                    int.parse(ageController.text),
                  );
                  setState(() {});
                }
              },

      ),
        /*    ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(400, 50),
                backgroundColor: AppColor.black,
              ),
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  await SharedPref.saveStringData("name", namecontroller.text);
                  await SharedPref.saveIntData(
                    "age",
                    int.parse(ageController.text),
                  );
                  setState(() {});
                }
              },

              child: Text("Save", style: TextStyle(color: AppColor.white)),
            ),*/
//get button
          Button(
        button_name: "Get",
       onPressed: () async {
                name = await SharedPref.getStringData("name");
                age = await SharedPref.getIntData("age");
                setState(() {});

                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.white,
                      ),
                      child: Column(
                        children: [
                          Text("Name : ${name ?? ""}"),
                          Text("Age : ${age?.toString() ?? ""}"),
                        ],
                      ),
                    );
                  },
                );
              },

      ),
          /*  ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(400, 50),
                backgroundColor: AppColor.black,
              ),
              onPressed: () async {
                name = await SharedPref.getStringData("name");
                age = await SharedPref.getIntData("age");
                setState(() {});

                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.white,
                      ),
                      child: Column(
                        children: [
                          Text("Name : ${name ?? ""}"),
                          Text("Age : ${age?.toString() ?? ""}"),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Text("Get", style: TextStyle(color: AppColor.white)),
            ),*/

            // remove button
                   Button(
        button_name: "Delete",
    onPressed: () {
                SharedPref.removeData("name");
                SharedPref.removeData("age");
              },

      ),     /*  
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(400, 50),
                backgroundColor: AppColor.black,
              ),
              onPressed: () {
                SharedPref.removeData("name");
                SharedPref.removeData("age");
              },
              child: Text("Delete", style: TextStyle(color: AppColor.white)),
            ),*/
          ],
        ),
      ),
    );
  }
}
