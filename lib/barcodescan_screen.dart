import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart' as scanner;

class BarcodeScanScreen extends StatefulWidget {
  const BarcodeScanScreen({super.key});

  @override
  BarcodeScanState createState() => BarcodeScanState();
}

class BarcodeScanState extends State<BarcodeScanScreen> {
  String _scanResult = "";

  Future<void> _scanBarcode() async {
    final result = await scanner.BarcodeScanner.scan();
    setState(() {
      _scanResult = result.rawContent;
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
            'Scan Result:',
            style: TextStyle(fontSize: 24.0),
          ),
          Text(
            _scanResult,
            style: const TextStyle(
                fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ],
      )
          : WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(Colors.white)
          ..loadRequest(Uri.parse('https://www.amazon.co.jp/dp/$_scanResult')),
        // initialUrl: 'https://www.amazon.co.jp/dp/$_scanResult',
        // javascriptMode: JavascriptMode.unrestricted,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scanBarcode,
        tooltip: 'Scan',
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}