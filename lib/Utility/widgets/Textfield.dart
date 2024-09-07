import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String hintText;
  final Function(String) onChanged;
  final EdgeInsets margin;
  final TextInputType KeyboardType;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.margin = const EdgeInsets.only(left: 20, right: 20, top: 10), required this.KeyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: margin,
          child: Text(
            labelText,
            style: const TextStyle(
              color: Colors.white, // Replace with your 'text' color variable
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Theme(
          data: ThemeData.dark(),
          child: Container(
            margin: margin.copyWith(top: 10, bottom: 20),
            height: 50,
            width: double.infinity,
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              keyboardType: KeyboardType,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: hintText,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder:  OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue,),
                  borderRadius: BorderRadius.circular(10)
                ),
                border: const OutlineInputBorder(),
              ),
              cursorColor: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
