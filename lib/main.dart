import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:math';

void main()=>runApp(MiApp());

class MiApp extends StatelessWidget {
  const MiApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mi App",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  Future<String> sendData() async{
    Random va = new Random();
    int aleatorio = va.nextInt(1001); //De 0 a incluyendo 1000
    print(aleatorio);
    DateTime fechahora = DateTime.now();
    String fechaformato = DateFormat('yyyy-MM-ddTHH:mm:ss').format(fechahora);
    var response = await http.post(
      Uri.encodeFull("https://apidoblematias.azurewebsites.net/api/aleatorio"),
      headers: {"Content-Type":"application/json"},
      body: jsonEncode(<String, dynamic>{
        "DateTime":fechaformato,
        "ValorRandom":aleatorio})
      );
      print(response.body);
    return response.body;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Parcial Aleatorio - Matias"),
     ),
     body: Center(
       child: new ElevatedButton(
         onPressed: sendData, 
         child: new Text("Enviar datos")
         ),
     ),
    );
  }
}
