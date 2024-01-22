import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mixer/models/room_model.dart';
import 'package:mixer/utils/Button.dart';

import '../reservation_screen/reservation_screen.dart';
import '../room_screen/room_screen.dart';

Widget buildStroke(String text, String image) => SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          Image.asset(
            image,
            height: 25,
            width: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontFamily: 'SFProDisplay',fontSize: 16),
                ),
                const Text(
                  "Самое необходимое",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'SFProDisplay',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF828796)),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Image.asset(
            'assets/image/icon.png',
            height: 25,
            width: 25,
          )
        ],
      ),
    );



Widget buildBox(String text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      color: const Color(0xFFFBFBFC),
      padding: const EdgeInsets.all(3.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w500,
          color: Color(0xFF828796),
        ),
      ),
    ),
  );
}

Widget buildImage(String urlImage, int index) => SizedBox(
      width: double.infinity,
      height: 250,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      ),
    );
