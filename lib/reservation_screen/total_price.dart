import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/reservation_model.dart';

class TotalPrice extends StatelessWidget {
  final Reservation reservation;

  TotalPrice({super.key, required this.reservation});

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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                buildRow("Тур", reservation.tourPrice.toString(), Colors.black),
                buildRow("Топливный сбор", reservation.fuelCharge.toString(), Colors.black),
                buildRow("Сервисный сбор", reservation.serviceCharge.toString(), Colors.black),
                sum(reservation.tourPrice, reservation.fuelCharge, reservation.serviceCharge, Color(0xFF0D72FF)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget sum(int tourPrice, int fuelCharge, int serviceCharge, Color color) {
  int sum = tourPrice + fuelCharge + serviceCharge;
  return buildRow("К оплате", sum.toString(), color);
}



  Widget buildRow(String firstText, String secondText, Color color) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              firstText,
              style: const TextStyle(
                fontSize: 16,fontFamily: 'SFProDisplay',
                fontWeight: FontWeight.w400,
                color: Color(0xFF828796),
              ),
            ),
            Expanded(
              child: Text(
                secondText,
                style:  TextStyle(fontFamily: 'SFProDisplay',
                  color: color,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                textAlign: TextAlign.end,
                softWrap: true,
              ),
            ),
          ],
        ),
      );
