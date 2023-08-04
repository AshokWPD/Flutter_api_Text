import 'package:flutter/material.dart';

class img_view extends StatefulWidget {
  final imgg;

  const img_view({super.key, 
    required this.imgg
  });


  @override
  State<img_view> createState() => _img_viewState();
}

class _img_viewState extends State<img_view> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(height: 500,width: 500,child:         Image.network(widget.imgg, fit: BoxFit.fill,),
)
        
      ),
    );
  }
}