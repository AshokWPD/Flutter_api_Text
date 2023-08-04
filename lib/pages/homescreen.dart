import 'dart:convert';

import 'package:dev_api/pages/imgview.dart';
import 'package:dev_api/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}


class _HomescreenState extends State<Homescreen> {

  List<dynamic> users =[];
   late bool loading;
  var error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("api call")) , backgroundColor: Colors.transparent,),
      body:ListView.builder(itemCount: users.length,itemBuilder: (context,index){
       final user = users[index];
       final email = user['user']['email'];
       final name = user['user']['name']['first'];

       final img = user['user']['picture']['large'];
      //         final username = user['user']['username'];
      //  final phone = user['user']['phone'];
       final location = user['user']['location']['city'];

        return  ListTile(
          leading: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder:(context) =>  img_view(imgg: img,),));
              // Center(child: SizedBox(height: 200,width: 200,child: Image.network(img),));
            },
            child: ClipRRect(borderRadius:BorderRadius.circular(100),
            child: Image.network(img),
            ),
          ),
          title: Text(name),
          subtitle:Text(email,),
          trailing: Text(location,style: const TextStyle(fontWeight: FontWeight.w300),),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const profile_page()));
          },
        );
      }),
      

      floatingActionButton: 
             FloatingActionButton(onPressed: fetchdata,backgroundColor: Colors.blue, child: const Icon(Icons.api_outlined),)

      );
      
    
  }
 

  void fetchdata() async {
  setState(() {
    loading = true; // Assuming you have a 'loading' state variable to track loading status
    error = null;   // Assuming you have an 'error' state variable to track errors
  });

  final url = Uri.parse('https://randomuser.me/api/0.8/?results=20');

  try {
    final response = await http.get(url);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
  } catch (e) {
    setState(() {
      error = "Error fetching data: $e"; // Update the error state with the error message
    });
  } finally {
    setState(() {
      loading = false; // Whether success or error, loading is finished
    });
  }

  print("fetch success!!!!!!!!!!!!!!!!!!");
}







//   void fetchdata() async {
    
//   final url = Uri.parse('https://randomuser.me/api/0.8/?results=20');

//  final responce =await http.get(url);
//  final body = responce.body;
//  final json = jsonDecode(body);
//  setState(() {
//    users = json['results'];
//  });
 
// print("fetsch success!!!!!!!!!!!!!!!!!!");
// }
  
}



