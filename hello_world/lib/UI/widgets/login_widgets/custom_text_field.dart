import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final Function(String val) onChanged;
  final TextInputAction _action;
  final TextInputType _type;
  final IconData _icon;
  const CustomTextField(
      this.hint, this.onChanged, this._action, this._icon, this._type);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
          keyboardType: _type,
          cursorColor: Color(0xFF011A43),
          onChanged: onChanged,
          textInputAction: _action,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            icon: Icon(_icon, color: Color(0xFF011A43)),
          )),
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(30)),
    );
  }
}
