import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mixer/hotel_screen/basic%20_information.dart';
import 'package:mixer/hotel_screen/hotel_details.dart';
import 'package:mixer/models/box_model.dart';
import 'package:mixer/room_screen/room_screen.dart';
import 'package:mixer/utils/Button.dart';


import '../client/hotel_service.dart';
import '../models/hotel_model.dart';

class HotelPage extends StatefulWidget {
  HotelPage(BuildContext context);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HotelPage> {
  late Future<Hotel> futureHotel;

  @override
  void initState() {
    super.initState();
    futureHotel = fetchHotel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F9),
      body: FutureBuilder<Hotel>(
        future: futureHotel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HotelScreen(hotel: snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

class HotelScreen extends StatelessWidget {
  final Hotel hotel;

  const HotelScreen({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HotelDetailsCard(imageUrls: hotel.imageUrls,
                rating: hotel.rating,
                ratingName: hotel.ratingName,
                name: hotel.name,
                address: hotel.address,
                minimalPrice: hotel.minimalPrice,
                priceForIt: hotel.priceForIt),

            HotelDetails(description: hotel.aboutTheHotel.description,
                peculiarities: hotel.aboutTheHotel.peculiarities),


            createButton("К выбору номера", () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RoomPage()),
              );
            })
          ],
        ),
    );
  }
}
