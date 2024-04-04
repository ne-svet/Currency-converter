import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../buttons/button_values.dart';
import '../controller/currency_controller.dart';
import '../logic/converter_logic.dart';
import '../navigation/my_navigation_bar.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({Key? key}) : super(key: key);

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  late ConverterLogic converterLogic;
  late CurrencyController currencyController;

  @override
  void initState() {
    super.initState();
    currencyController = CurrencyController();
    converterLogic = ConverterLogic(
      updateStateCallback: () {
        setState(() {});
      },
      currencyController: currencyController,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // Передаем converterLogic в MyNavigationBar,
      bottomNavigationBar: MyNavigationBar(converterLogic: converterLogic),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      converterLogic.txtToDisplay.isEmpty
                          ? "0"
                          : converterLogic.txtToDisplay,
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    converterLogic.flag == true ? 'EUR >' : 'USD >',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      converterLogic.txtConverted.isEmpty
                          ? "0"
                          : converterLogic.txtConverted,
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    converterLogic.flag == false ? 'EUR' : 'USD',
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Wrap(
                  children: Buttons.buttonValuesConverter.map((value) {
                    return SizedBox(
                      width: screenSize.width / 3,
                      height: screenSize.width / 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: () {
                            // вставьте вашу логику сюда
                            if (value == Buttons.clear) {
                              converterLogic.clearAll();
                            } else {
                              converterLogic.appendValue(value);
                            }
                          },
                          child: Text(
                            value.toString(),
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
