import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/reservation_model.dart';

Future<Reservation> fetchReservation() async {
  final response = await http.get(Uri.parse('https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff'));

  if (response.statusCode == 200) {
    return Reservation.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load hotel');
  }
}