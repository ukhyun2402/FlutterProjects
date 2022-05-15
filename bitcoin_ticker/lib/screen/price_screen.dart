import 'dart:developer';

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/services/coin_network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "USD";
  CoinNetwork? coinNetwork;
  Map<String, dynamic> cryptoPrice = {};
  bool isLoading = true;

  dynamic getPriceData(String crypto) async {
    coinNetwork ??= CoinNetwork();
    var result;
    try {
      result = await coinNetwork!.getBTC(selectedCurrency, crypto);
      isLoading = false;
    } catch (e) {}
    // var result = await coinNetwork!.getBTC(selectedCurrency, crypto);
    // isLoading = false;
    // log(isLoading.toString());
    return result;
  }

  @override
  void initState() {
    super.initState();
    for (var crypto in cryptoList) {
      cryptoPrice.addEntries({crypto: "?"}.entries);
    }
    getCryptoPrice();
  }

  void getCryptoPrice() async {
    Map<String, dynamic> new_cryptoPrice = {};
    for (String crypto in cryptoList) {
      var infoCrypto = await getPriceData(crypto);
      String price =
          (infoCrypto['rate'] as double).toStringAsFixed(2).toString();

      new_cryptoPrice.addEntries({crypto: price}.entries);
    }
    setState(() {
      cryptoPrice = new_cryptoPrice;
    });
  }

  List<Widget> getPriceCards() {
    List<Widget> result = [];
    // make widget and add to result list
    for (String crypto in cryptoPrice.keys) {
      result.add(CryptoCard(
          crypto, selectedCurrency, isLoading ? "?" : cryptoPrice[crypto]));
    }
    return result;
  }

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> result = [];

    for (var curreny in currenciesList) {
      result.add(DropdownMenuItem(
        child: Text(curreny),
        value: curreny,
      ));
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: result,
      onChanged: (value) {
        setState(() {
          isLoading = true;
          selectedCurrency = value.toString();
          getCryptoPrice();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Widget> result = [];

    for (var curreny in currenciesList) {
      result.add(Center(
        child: Text(
          curreny,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 50,
      onSelectedItemChanged: (selectedIndex) {
        isLoading = true;
        selectedCurrency = currenciesList[selectedIndex];
        getCryptoPrice();
      },
      children: result,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("🤑 Coin Ticker"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...getPriceCards(),
          Container(
            height: 150,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          )
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget {
  String price = "?";
  String curreny;
  String crypto;

  CryptoCard(this.crypto, this.curreny, this.price);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
        child: Card(
          color: Colors.lightBlueAccent,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 28),
            child: Text(
              "1 $crypto = ${price} $curreny",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
}
