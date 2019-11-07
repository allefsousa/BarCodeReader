


import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarCodeBlock{
  String result = "Vazio";


   resultRequest(){
    return readBarCode().then((value){
      result = value;
    });
  }

  Future<String> readBarCode() async{
    return  await FlutterBarcodeScanner.scanBarcode(
        "#FFFFFF", "Cancelar", true, ScanMode.BARCODE);
  }

}