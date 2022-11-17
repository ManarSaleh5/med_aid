import 'dart:async';

import 'package:flutter/material.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) =>MyStatefulWidget(
           firstlist: [],
        )
      )
    );
  }

  initScreen(BuildContext context) {

    return Scaffold(
      backgroundColor:  Color(0xFF91c4aa),
      
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //  Text(
            //   "welcome to",
            //   style: TextStyle(
            //       fontSize: 40.0,
            //       color: Color.fromARGB(255, 42, 94, 68),
            //   ),
            // ),
            
//             Container(
//   constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width, 
//   maxHeight: MediaQuery.of(context).size.height*0.85
//   ),
//                 // child: Image.asset(
//                 //   'assets/images/mmm3.png',
//                 //   fit: BoxFit.contain,
//                 // ),

//  )
 Container(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.00,
                            bottom: MediaQuery.of(context).size.height * 0.01),
                        child: Image.asset('assets/images/mm1.png'),
                      ),
            // Container(
            //   height: 400,
            //   child: Image.asset("assets/images/logo4-removebg-preview.png"),

            // ),
            // Padding(padding: EdgeInsets.only(top: 20.0)),
           
            // Padding(padding: EdgeInsets.only(top: 20.0)),
            // CircularProgressIndicator(
            //   backgroundColor: Colors.white,
            //   strokeWidth: 1,
            // )
          ],
        ),
      ),
    );
  }
}