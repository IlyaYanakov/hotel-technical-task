import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:mixer/reservation_screen/reservation_screen.dart';

class TouristInformationDropdown extends StatelessWidget {
  List<String> stringList = [
    'Первый',
    'Второй',
    'Третий',
    'Четвёртый',
    'Пятый',
    'Шестой',
    'Седьмой',
    'Восьмой',
    'Девятый',
    'Десятый'
  ];

  final int index;

   TouristInformationDropdown({super.key, required this.index});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
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
              child: ExpandablePanel(
                header: Text(
                  '${stringList[index]} Турист ',
                  // Используем индекс для вывода номера туриста
                  style: const TextStyle(
                      fontFamily: 'SFProDisplay',
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                collapsed: Container(),
                expanded: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFF6F6F9),
                            labelText: 'Имя',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFF6F6F9),
                            labelText: 'Фамилия',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFF6F6F9),
                            labelText: 'Дата рождения',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFF6F6F9),
                            labelText: 'Гражданство',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFF6F6F9),
                            labelText: 'Номер загранпаспорта',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: const TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            filled: true,
                            fillColor: Color(0xFFF6F6F9),
                            labelText: 'Срок действия загранпаспорта',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildBoxAdd(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () {
            (context as Element)
                .findAncestorStateOfType<ReservationPageState>()
                ?.addTourist();
          },
          child: Container(
            height: 60,
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Добавить туриста',
                      style: TextStyle(
                          fontFamily: 'SFProDisplay',
                          fontWeight: FontWeight.w500,
                          fontSize: 22),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                        color: Color(0xFF0D72FF),
                      ),
                      child: const Center(
                        child: Image(
                            image: AssetImage("assets/image/icon_plus.png")),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
