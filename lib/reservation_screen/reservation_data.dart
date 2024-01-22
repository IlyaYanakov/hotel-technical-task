import 'package:flutter/material.dart';

import '../models/reservation_model.dart';

class ReservationData extends StatelessWidget{
  final Reservation reservation;

  ReservationData({super.key,  required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                buildRow("Вылет из", reservation.departure),
                buildRow("Страна, город", reservation.arrivalCountry),
                buildRow("Даты",
                    "${reservation.tourDateStart} - ${reservation.tourDateStop}"),
                buildRow("Кол-во ночей",
                    reservation.numberOfNights.toString()),
                buildRow("Отель", reservation.hotelName),
                buildRow("Номер", reservation.room),
                buildRow("Питание", reservation.nutrition),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(String firstText, String secondText) => Padding(
    padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
    child: Row(
      children: [
        Expanded(
          child: Text(
            firstText,
            style: const TextStyle(
                fontSize: 16, fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,
                color: Color(0xFF828796)),
          ),
        ),
        Expanded(
          child: Text(
            secondText,
            style: const TextStyle(fontFamily: 'SFProDisplay',fontWeight: FontWeight.w400, fontSize: 16),
            softWrap: true,
          ),
        ),
      ],
    ),
  );
}