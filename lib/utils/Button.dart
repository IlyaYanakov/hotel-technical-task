import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mixer/room_screen/room_screen.dart';

Widget createButton(String text, Function() onPressed) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(

          backgroundColor: MaterialStateProperty.all(const Color(0xFF0D72FF)),
        ),
        child: Text(text, style: const TextStyle(fontFamily: 'SFProDisplay', color: Colors.white)),
      ),
    ),
  );
}

