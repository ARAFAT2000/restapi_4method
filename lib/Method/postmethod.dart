import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../style/textformedstyle.dart';



/// Send button ar data type ble dibo,jei gulo sent krbo
/// toString use kre int data pass krbo
/// dispose krle,,store cleare thake all time
/// stutasCode altime 201 hoy

class PostMethod extends StatefulWidget {
  const PostMethod({super.key});

  @override
  State<PostMethod> createState() => _PostMethodState();
}

class _PostMethodState extends State<PostMethod> {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void Send(String name,String phone,dynamic email)async{

    final response = await http.post(Uri.parse('https://reqres.in/api/users'),
        body:{
          'name': name,
          'phone': phone,
          'email':email
        } );

    try{
      if(response.statusCode==201){
        print(response.statusCode);
        print(response.body);
        print('Succesfully created');

        nameController.clear();
        emailController.clear();
        phoneController.clear();
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
        centerTitle:  true,
        title: Text('POST METHOD'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(

              controller: nameController,
              decoration: AppInputDecoration(' name'),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller:  phoneController,
              decoration: AppInputDecoration('phone number'),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: emailController,
              decoration: AppInputDecoration('email '),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: (){
                 Send(nameController.text.toString(),
                     phoneController.text.toString(),
                     emailController.text.toString());
                },
                child: Text('Send ')),

            /// body te show krar jnno
            ///
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text('Arafat'),
                      subtitle: Text('islam'),
                    );
                  }),
            )


          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }
}
