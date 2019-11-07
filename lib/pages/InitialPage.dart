import 'package:flutter/material.dart';
import 'package:leitor_barcode/bloc/BarCodeBloc.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  var bloc;
  String result = "Vazio";

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  void initState() {
    super.initState();
     bloc = new BarCodeBlock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Leitor de codigo de barras"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20.0),
            width: double.infinity,
            height: 50.0,
            child: FlatButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                "Ler Codigo de barras",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                _openBarCode();
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child:Text(result)
          )
        ],
      ),
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    String value = snapshot.data;
    return Text(value);
  }

  void _openBarCode(){
    bloc.readBarCode().then((list) {
      setState(() {
        result = list;
      });
    });
  }
}
