class CurrencyData {

  //данные по валютам в отношенни к евро
  num eur;
  num usd;
  num rub;
  num dkk;

  //конструктор
  CurrencyData(this.eur, this.usd, this.rub, this.dkk);


  //map объект (словарь) из JSON
  // Парсим JSON в объект.
  // НАСЛЕДОВАНИЕ. Factory pattern, позволяет создавать объекты,
  // заранее не зная какого типа объект будет создан
  factory CurrencyData.fromJson(Map<String, dynamic> json) {
    num eur = json['rates']['EUR'];
    num usd = json['rates']['USD'];
    num rub = json['rates']['RUB'];
    num dkk = json['rates']['DKK'];

    return CurrencyData(eur, usd, rub, dkk);
  }
}