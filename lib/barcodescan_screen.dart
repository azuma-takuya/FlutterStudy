import 'package:barcode_scan2/barcode_scan2.dart' as scanner;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BarcodeScanScreen extends StatefulWidget {
  const BarcodeScanScreen({super.key});

  @override
  BarcodeScanState createState() => BarcodeScanState();
}

extension JanToIsbnStringExtension on String {
  String convertJanToIsbn() {
    const janCodeLength = 13;
    const startIsbnIndex = 3;
    const endIsbnIndex = 12;
    const checkDigitModulo = 11;
    const checkDigitXValue = 10;

    if (length != janCodeLength) {
      throw const FormatException('不正なJANコードです');
    }

    var isbn = substring(startIsbnIndex, endIsbnIndex);
    var checkDigit = 0;

    final isbnList = isbn.split('');

    try {
      checkDigit = isbnList.asMap().entries.map((e) {
        return int.parse(e.value) * (e.key + 1);
      }).reduce((value, element) => value + element);
    } on FormatException {
      throw const FormatException('不正なJANコードです');
    }

    checkDigit %= checkDigitModulo;

    return isbn + ((checkDigit == checkDigitXValue) ? 'X' : checkDigit.toString());
  }
}

class BarcodeScanState extends State<BarcodeScanScreen> {
  String _scanResult = '';
  final _webViewController = WebViewController();

  Future<void> _scanBarcode() async {
    await _webViewController.clearCache();
    final result = await scanner.BarcodeScanner.scan();
    setState(() {
      _scanResult = result.rawContent.convertJanToIsbn();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Scanner'),
      ),
      body: _scanResult.isEmpty
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'バーコードスキャンしてください',
            style: TextStyle(fontSize: 24.0),
            textAlign: TextAlign.center,
          ),
          Text(
            _scanResult,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      )
          : WebViewWidget(
        controller: _webViewController
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(Colors.white)
          ..loadRequest(Uri.parse('https://www.amazon.co.jp/dp/$_scanResult')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scanBarcode,
        tooltip: 'Scan',
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
