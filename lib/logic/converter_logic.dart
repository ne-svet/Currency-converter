import 'dart:ui';

import 'package:currency_exchange/Entities/currency_data.dart';

import '../controller/currency_controller.dart';

class ConverterLogic {
  String txtConverted = "";
  String txtToDisplay = "";
  bool flag = true;



  // обновление состояния на экране
  late VoidCallback updateStateCallback;

  // Добавляем поле для CurrencyController
  final CurrencyController currencyController;


  ConverterLogic({required this.updateStateCallback, required this.currencyController});

  //добавляем value в выражение
  void appendValue(String value) {
    // Иначе, добавляем оператор к выражению
    txtToDisplay += value;
    updateStateCallback();
  }

  //delete function последнюю цифру

  void backsp() {
    if (txtToDisplay.isNotEmpty) {
      txtToDisplay = txtToDisplay.substring(0, txtToDisplay.length - 1);
      updateStateCallback();
    }
  }

  // очистить экран

  void clearAll() {
    txtToDisplay = '';
    txtConverted = '';
    updateStateCallback();
  }

  //конвертер
  void convertCurrency() async{
    double eur;
    double usd;

    CurrencyData cd = await currencyController.fetchCurrency();
    num koef_EurToUsd = cd.usd;


    if (txtToDisplay.isEmpty) {
      return;
    } else if (flag == true) {
      eur = double.parse(txtToDisplay);
      usd = eur * koef_EurToUsd;
      usd = double.parse(usd.toStringAsFixed(5));
      txtConverted = usd.toString();

    } else if (flag == false) {
      usd = double.parse(txtToDisplay);
      eur = usd / koef_EurToUsd;
      eur = double.parse(eur.toStringAsFixed(5));
      txtConverted = eur.toString();
      // from API

    }

    //обновляем состояние
    updateStateCallback();
  }

  //поменять единицы
  void changeUnits() {
    flag = !flag;
    updateStateCallback();
  }
}
