import 'package:barcode_scan2/barcode_scan2.dart' as scanner;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'jan_to_isbn_string_extension.dart';

class BarcodeScanScreen extends StatefulWidget {
  const BarcodeScanScreen({super.key});

  @override
  BarcodeScanState createState() => BarcodeScanState();
}

//命名を帰る　アンスコつける
//もしくは別ファイルにして呼び出して使いまわせるようにする

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
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
          Text(
            _scanResult,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold,),
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
