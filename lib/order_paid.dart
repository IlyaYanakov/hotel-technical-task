import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mixer/utils/Button.dart';

class OrderPaid extends StatelessWidget {
  const OrderPaid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppBar(
            centerTitle: true,
            title: const Text('Заказ оплачен'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          const Column(
            children: [
              Image(image: AssetImage("assets/image/happy_image.png"),
                height: 100,
                width: 100,),
              Text("Ваш заказ принят в работу",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),),
              Text("Подтверждение заказа №104893 может "
                  "занять некоторое время (от 1 часа до суток)."
                  " Как только мы получим ответ от туроператора, "
                  "вам на почту придет уведомление.",
                style: TextStyle(fontSize: 16, color: Color(0xFF828796),),
                textAlign: TextAlign.center,)
            ],
          ),
          createButton("Супер!", () => null)
        ],
      ),
    );
  }
}