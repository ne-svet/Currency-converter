import 'package:currency_exchange/Entities/currency_data.dart';
import 'package:currency_exchange/controller/currency_controller.dart';
import 'package:flutter/material.dart';

import '../logic/converter_logic.dart';

class MyNavigationBar extends StatefulWidget {
  final ConverterLogic converterLogic; // Добавляем поле converterLogic

  const MyNavigationBar({
    Key? key,
    required this.converterLogic, // Принимаем converterLogic через конструктор
  }) : super(key: key);

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.pinkAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                widget.converterLogic.changeUnits(); // Используем converterLogic из widget
              },
              child: Align(
                alignment: Alignment.center,
                child: Ink(
                  child: Icon(
                    Icons.change_circle,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ),

          // Экран конвертера в мили
          Expanded(
            child: InkWell(
              onTap: () async {
                widget.converterLogic.convertCurrency();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Convert',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
