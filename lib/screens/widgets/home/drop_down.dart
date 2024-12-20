import 'package:flutter/material.dart';

class DropdownButtons extends StatelessWidget {
  const DropdownButtons({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> options = <String>['One', 'Two', 'Three', 'Four'];
    String dropdownValue = 'One';

    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.grey,
          width: 1.0, 
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButton<String>(
        value: dropdownValue,
        onChanged: (String? value) {
         
        },
        underline: const SizedBox(),
        isExpanded: true,
        style: const TextStyle(color: Colors.black),
        dropdownColor: Colors.white,
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
        selectedItemBuilder: (BuildContext context) {
          return options.map((String value) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Text(
                dropdownValue,
              ),
            );
          }).toList();
        },
        items: options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
