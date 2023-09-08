import 'package:flutter/material.dart';

class Constant {
  static const formDecorationA = InputDecoration(
      filled: true,
      hintText: 'email',
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide.none),
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
      fillColor: Color(0xFFD9D9D9));
}
