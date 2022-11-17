
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ChatDetailPage extends StatefulWidget{
  @override
   List firstlist;
  ChatDetailPage({Key? key, required this.firstlist}) : super(key: key);
  _ChatDetailPageState createState() => _ChatDetailPageState();
}
List textm = [
    "", //city
    "", //town 
    "", //street
    "", //phone 
  
  ];
 String title=" ";
    String text = " ";
class _ChatDetailPageState extends State<ChatDetailPage> {
     void _setText() {
    setState(() {
      text = title;
    });
  }
  @override
  Widget build(BuildContext context) {

   return Scaffold(
     
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor:  Color(0xFF91c4aa),
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 18),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,color: Colors.black,),
                ),
                SizedBox(width: 2,),
                CircleAvatar(
                  
                   backgroundImage:AssetImage("assets/images/chat.png"),
                           backgroundColor: Colors.transparent,
                  maxRadius: 57,
                ),
                SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Pharmacist",style: TextStyle( fontSize: 22 ,fontWeight: FontWeight.w600),),
                      SizedBox(height: 6,),
                     // Text("Online",style: TextStyle(color: Colors.grey.shade600, fontSize: 13),),
                    ],
                  ),
                ),
               // Icon(Icons.settings,color: Colors.black54,),
              ],
            ),
          ),
        ),
      ),
       
      //body: Container()
      body: 
     Stack(
      
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
          
              padding: EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
             
              child: Row(
                children: <Widget>[
                 Expanded(
                     child: Form(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(),
                       
            
                      ),
                      onChanged: (value) => title = value,
                     )),
                 ),
                   FloatingActionButton(
                    onPressed: (){
                     


                    },
                    
                    
                    child:
                                        IconButton(
                      icon: Icon( Icons.send, size: 18,),
                   onPressed: (){  
                     text = title;
    },
      
    ),
                    
                    
                  
                    
                    // Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Color.fromARGB(255, 70, 143, 88),
                    elevation: 0,
                  ),
                
               
                  SizedBox(width: 15,),
                
                 
                ],
                
              ),
            ),
          ),
          Text(text,  textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Color.fromARGB(255, 42, 94, 68),
                fontSize: 20,))
         
        ],
        
   
      ),
     
    );
   
  
  }
}
