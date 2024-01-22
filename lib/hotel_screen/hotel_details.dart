import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/box_model.dart';

class HotelDetails extends StatelessWidget{
  final String description;
  final List<String> peculiarities;

  const HotelDetails({super.key, required this.description,
    required this.peculiarities,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Об отеле",
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'SFProDisplay',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF000000))),
                Wrap(
                  children: peculiarities
                      .map((facility) => buildBox(facility))
                      .toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    description,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontFamily: 'SFProDisplay',fontSize: 16),
                  ),
                ),
                buildStroke("Удобства", "assets/image/emoji-happy.png"),
                buildStroke("Что включено", "assets/image/tick-square.png"),
                buildStroke("Что не включено", "assets/image/close-square.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }

}