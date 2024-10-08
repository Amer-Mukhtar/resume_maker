import 'package:flutter/material.dart';

class CustomSummaryFieldNON extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String hintText;
  final Function(String) onChanged;
  final EdgeInsets margin;
  final double height;
  final double borderWidth;
  final Color borderColor;

  const CustomSummaryFieldNON({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    this.margin = const EdgeInsets.only(bottom: 5),
    required this.height ,
    this.borderWidth = 1.0,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: margin,
          child: Row(
            children: [
              Text(
                labelText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('',style:const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ), )
            ],
          ),
        ),
        Container(
          margin: margin.copyWith(top: 0, bottom: 0, right: 0),
          padding: const EdgeInsets.all(0),
          height: height,

          child: Theme(
            data: ThemeData.dark(),
            child: TextField(
              cursorColor: Colors.white,
              expands: true,
              maxLines: null,
              minLines: null,
              keyboardType: TextInputType.multiline,
              controller: controller,
              onChanged: onChanged,
              textAlignVertical: TextAlignVertical.top,

              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:borderColor),
                  borderRadius: BorderRadius.circular(10), // Different border radius for unselected state
                ),

                focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,),
                    borderRadius: BorderRadius.circular(10)
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintStyle: const TextStyle(color: Colors.white54),
                hintText: hintText,
                contentPadding: const EdgeInsets.all(10.0),

              ),
            ),
          ),
        ),
      ],
    );
  }
}
