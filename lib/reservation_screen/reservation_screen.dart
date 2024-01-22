import 'package:flutter/material.dart';
import 'package:mixer/client/reservation_service.dart';
import 'package:mixer/models/reservation_model.dart';
import 'package:mixer/order_paid.dart';
import 'package:mixer/reservation_screen/hotel.dart';
import 'package:mixer/reservation_screen/reservation_data.dart';
import 'package:mixer/reservation_screen/total_price.dart';
import 'package:mixer/reservation_screen/tourist_information.dart';
import 'package:mixer/utils/Button.dart';

import 'buyer_information.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({super.key});

  @override
  ReservationPageState createState() => ReservationPageState();
}

class ReservationPageState extends State<ReservationPage> {
  List<TouristInformationDropdown> tourists = [];
  late Future<Reservation> futureReservation;

  @override
  void initState() {
    super.initState();
    futureReservation = fetchReservation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F9),
      body: FutureBuilder<Reservation>(
        future: futureReservation,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    centerTitle: true,
                    title: const Text('Бронирование'),
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        HotelInf(reservation: snapshot.requireData),
                        ReservationData(reservation: snapshot.requireData),
                        ByuerInformation(),
                        Column(
                          children: List.generate(tourists.length, (index) => TouristInformationDropdown(index: index)),
                        ),
                        buildBoxAdd(context),
                        TotalPrice(reservation: snapshot.requireData),
                        createButton("Оплатить", () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const OrderPaid()),
                          );
                        })
                      ],
                    ),
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
  void addTourist() {
    setState(() {
      tourists.add(TouristInformationDropdown(index: tourists.length)); // Передаем текущий индекс
    });
  }
}


