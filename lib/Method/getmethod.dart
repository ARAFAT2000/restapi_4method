import 'package:flutter/material.dart';
import '../services/all_methodapi.dart';


///body te show krar jnno kichu tips
///Futute a SelecMethod().GetMethod() dite hbe,cause services folder theke call krchi
///snapshot.hasdata diye check krchi  jodi data thake tahle ListView.builder a dekhabe
///  id and UserId , Int typer so,,,ader sese toString dite hbe
///  String type ar data hoile toString dite hbe na
///  snapshot.data[indext]['title'] means
///  snapshot a jodi data pay,tahle index akare title show krbe

class GetMethod extends StatefulWidget {
  const GetMethod({super.key});

  @override
  State<GetMethod> createState() => _GetMethodState();
}

class _GetMethodState extends State<GetMethod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:  true,
        title: Text('GET METHOD'),
      ),
     body: FutureBuilder(
         future: SelecMethod().GetMethod(),
         builder:(context,snapshot){
           if(snapshot.hasData){
             return ListView.builder(
               itemCount: snapshot.data.length,
                 itemBuilder: (context,index){
                   return Card(
                     child: ListTile(
                       leading: CircleAvatar(child: Text(snapshot.data[index]['id'].toString())),
                        title: Text(snapshot.data[index]['title']),
                       subtitle: Text(snapshot.data[index]['userId'].toString()),
                     ),
                   );
                 });
           }
           return Center(child: CircularProgressIndicator());
         }),
    );
  }
}
