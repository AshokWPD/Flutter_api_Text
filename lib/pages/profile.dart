import 'package:flutter/material.dart';

class profile_page extends StatefulWidget {
  final String name;
  final String location;
  final String gender;
  final String email;
  final img;
  final String phone;
  final String username;
   const profile_page({super.key, required this.email,required this.gender,required this.img,required this.location,required this.name,required this.phone,required this.username});

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [Container(
                height: 350,
                width: double.infinity,
                color: Colors.blue,
                child: Image.network(widget.img,fit: BoxFit.fill,),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 15),
                child: SizedBox(
                  height: 30,
                  width: double.infinity,
                  child:  Row(
                    children: [
                      const Text("User Name : " , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      const Spacer(),
                                          Text(widget.username , style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
          
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness:.4,
                
                color: Colors.black

              ),
              
               Padding(
                padding: const EdgeInsets.only(left: 20,right: 15),
                child: SizedBox(
                  
                  height: 30,
                  width: double.infinity,
                  child:  Row(
                    children: [
                      const Text("Name : " , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      const Spacer(),
                                          Text(widget.name , style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
          
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness:.4,
                
                color: Colors.black

              ),
               Padding(
                padding: const EdgeInsets.only(left: 20,right: 15),
                child: SizedBox(
                  height: 30,
                  width: double.infinity,
                  child:  Row(
                    children: [
                      const Text("Email : " , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      const Spacer(),
                                          Text(widget.email , style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
          
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness:.4,
                
                color: Colors.black

              ),
               Padding(
                padding: const EdgeInsets.only(left: 20,right: 15),
                child: SizedBox(
                  height: 30,
                  width: double.infinity,
                  child:  Row(
                    children: [
                      const Text("Gender : " , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      const Spacer(),
                                          Text(widget.gender , style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
          
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness:.4,
                
                color: Colors.black

              ),
               Padding(
                padding: const EdgeInsets.only(left: 20,right: 15),
                child: SizedBox(
                  height: 30,
                  width: double.infinity,
                  child:  Row(
                    children: [
                      const Text("phone number : " , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      const Spacer(),
                                          Text(widget.phone , style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
          
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness:.4,
                
                color: Colors.black

              ),
               Padding(
                padding: const EdgeInsets.only(left: 20,right: 15),
                child: SizedBox(
                  height: 30,
                  width: double.infinity,
                  child:  Row(
                    children: [
                      const Text("location : " , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      const Spacer(),
                                          Text(widget.location , style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
          
                    ],
                  ),
                ),
              )
              , const Divider(
                thickness:.4,
                
                color: Colors.black

              ),
              const SizedBox(
                height: 30,
              )
              ,  const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.email_outlined,size: 50,color: Colors.blue,),
                        Text("Email",style: TextStyle(color: Colors.blue),),


                      ],
                    ),
                    SizedBox(width: 40,),
                    Column(
                      children: [
 Icon(Icons.call,size: 50,color: Colors.blue,),
               Text("call",style: TextStyle(color: Colors.blue),),
                      ],
                    )
                   

              
                  ],
                ),
              )
              
              ],
            ),
          ),

          
    
        ),
      ),
    );
  }
}