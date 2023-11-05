import 'package:flutter/material.dart';

InputDecoration AppInputDecoration(hin){
  return InputDecoration(
    border: OutlineInputBorder(
       borderRadius: BorderRadius.circular(25.0),
    ),

      hintText: hin
  );
}