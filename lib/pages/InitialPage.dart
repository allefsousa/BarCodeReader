import 'package:flutter/material.dart';
import 'package:leitor_barcode/bloc/BarCodeBloc.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  var bloc = new BarCodeBlock();

  String result = "Vazio";

  @override
  void setState(fn) {
    super.setState(fn);

    bloc.resultRequest().then((val) => setState(() {
          result = val;
        }));
  }

  @override
  void initState() {
    super.initState();
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
                setState(() {
                  bloc.readBarCode();
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: new FutureBuilder(
              future: bloc.readBarCode(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return new Text('loading...');
                  default:
                    if (snapshot.hasError)
                      return new Text('Error: ${snapshot.error}');
                    else
                      return createListView(context, snapshot);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    String value = snapshot.data;
    return Text(value);
  }
}
