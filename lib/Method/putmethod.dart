import 'dart:convert';

import 'package:flutter/material.dart';
import '../style/textformedstyle.dart';
import 'package:http/http.dart' as http;


class PUTMETHOD extends StatefulWidget {
  const PUTMETHOD({super.key});

  @override
  State<PUTMETHOD> createState() => _PUTMETHODState();
}

class _PUTMETHODState extends State<PUTMETHOD> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Future PutMethod(String name, dynamic email)async{

    final response = await http.put(Uri.parse('https://reqres.in/api/users/2'),
        body: {
          'name': name,
          'email': email
        }
    );

    try{
      if(response.statusCode==200){
        print(response.statusCode);
        print(response.body);
        print('Succesfully created');
        nameController.clear();
        emailController.clear();
      }else CircularProgressIndicator();
    }catch(e){
      print(e);
    }
    return jsonDecode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PUT METHOD'),
      ),
      
      body: Padding(padding: EdgeInsets.all(15),
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: AppInputDecoration('name'),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: emailController,
            decoration: AppInputDecoration('email'),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(onPressed: (){
            PutMethod(nameController.text.toString(), emailController.text.toString());
          },
              child: Text('Update'))
          
        ],
      ),),
    );
  }
  @override
  void dispose() {
    nameController.clear();
    emailController.clear();
    // TODO: implement dispose
    super.dispose();
  }
}
