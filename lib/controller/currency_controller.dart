import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Entities/currency_data.dart';

class CurrencyController {
  static const String _endpoint = 'https://open.er-api.com/v6/latest/EUR';

  // Асинхронный метод для получения данных о валютном курсе
  Future<CurrencyData> fetchCurrency() async {
    // Отправляем GET-запрос к API
    final response = await http.get(Uri.parse(_endpoint));

    // Проверяем статус код ответа
    if (response.statusCode == 200) {
      // Если запрос успешен, декодируем полученные данные и возвращаем объект CurrencyData
      return CurrencyData.fromJson(jsonDecode(response.body));
    } else {
      // Если запрос не удался, выбрасываем исключение
      throw Exception('Failed to load the currency rate');
    }
  }
}