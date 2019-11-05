


import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarCodeBlock{

  Future<String> resultRequest()async{
    return readBarCode();
  }

  Future<String> readBarCode() async{
    return  await FlutterBarcodeScanner.scanBarcode(
        "#FFFFFF", "Cancelar", true, ScanMode.BARCODE);
  }

}