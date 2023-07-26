// Add your imports here.
import 'dart:convert';
import "package:http/http.dart" as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '7F5E2376-F332-433C-9252-F79A8ACF1777';

class CoinData {
  //Create your getCoinData() method here.
  Future getCoinData () async {
    String urlRequest = '$coinURL/BTC/USD?apikey=$apiKey';
    http.Response response = await http.get(Uri.parse(urlRequest));
    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);
      var price = decode['rate'];

      return price;
    } else {
      print(response.statusCode);
    }
  }

}
