import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:restapi_4method/Method/putmethod.dart';

/// SelecMethod class ar vitore sob api(GET,POST,PUT,DELETE) create kra ache
/// Future ,async and await asob Future type ar data,Net connection diye krte hoy,,
/// async means asyncronuss type data,net connection ar jnno ase
/// await means net ar karone aste late hoile
/// get means data website a ache,,,seta k niye asa
/// jsonDecode means json theke String kra
/// try and catch kra hoy jeno ,,,,error asle seta remove kre
/// Get request a stutasCode = 200 hoy,,so,,seta chaile check krte pari,
/// try theke  catch porjonto na dile o problem nai

class SelecMethod{

Future GetMethod()async{

  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

  try{
    if(response.statusCode==200){
      print(response.statusCode);
    }else CircularProgressIndicator();
  }catch(e){
    print(e);
  }
  return jsonDecode(response.body);
}

/// post method use krchi
/// stutasCode 201 hbe (reqres website a gele pawya jabe

Future PostMethod()async{

  final response = await http.post(Uri.parse('https://reqres.in/api/users'));

  try{
    if(response.statusCode==201){
      print(response.statusCode);
      print('Succesfully created');
    }else CircularProgressIndicator();
  }catch(e){
    print(e);
  }
  return jsonDecode(response.body);
}
/// Put Method thats means Update krte use kra hoy
///akhne theke put method+ Post method soriye nilam
///jei page a jeta krbo,,oita oi page ai hbe normaly
///ai page a  get method ache,thats means ,akhne navigate kte use kra jabe
///onno method use krle error dekhabe


}