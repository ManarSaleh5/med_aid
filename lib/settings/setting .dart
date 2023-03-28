import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:gp1_med_aid/notification.dart';
import 'package:gp1_med_aid/settings/privacy.dart';
import 'package:gp1_med_aid/settings/profilee.dart';
import 'package:gp1_med_aid/settings/change_password.dart';
import '../main.dart';
import 'package:gp1_med_aid/settings/notoficationse.dart';

// import 'package:gp1_med_aid/reset_pass.dart';
// import 'package:gp1_med_aid/information.dart';


class setting_screen extends StatefulWidget {
  
  List firstlist;
  setting_screen({Key? key, required this.firstlist}) : super(key: key);
    State<StatefulWidget> createState() => setting_screenSt();
}
 
class setting_screenSt extends State<setting_screen> {
   Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
     int id=int.parse(widget.firstlist[0]);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFF91c4aa),
        toolbarHeight: MediaQuery.of(context).size.height * 0.11,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color:Color.fromARGB(255, 42, 94, 68),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.07,
            child: Image.asset(
              'assets/images/logoo1-removebg-preview.png',
              fit: BoxFit.cover,
            ),

            //
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Color(0xFF91c4aa),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              "Application settings can be customized according to your preferences",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Color.fromARGB(255, 42, 94, 68),
                fontSize: size.height * 0.025,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            newMethod(context, size, ' Account', Icons.person, 0,id),
            newMethod(context, size, 'Change Password', Icons.key_outlined, 2,id),
            newMethod(context, size, ' Privacy & Security', Icons.lock, 3,id),
            newMethod(context, size, 'Notification', Icons.notifications, 4,id),
             newMethod(context, size, ' Log out ', Icons.logout, 1,id),
          ],
        ),
      ),
    );
  }

  Padding newMethod(
  BuildContext context, Size size, String st, IconData next, int i,int k) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.height * 0.015, vertical: size.height * 0.015),
      // child: FlatButton(
        child:MaterialButton(
          padding: EdgeInsets.only(
              left: size.height * 0.03,
              right: size.height * 0.025,
              top: size.height * 0.009,
              bottom: size.height * 0.01),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Color(0xFF91c4aa).withOpacity(0.5),
          onPressed: () {
            callpage(i,context,k);
          },
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  next,
                  color: Color.fromARGB(255, 42, 94, 68),
                  size: MediaQuery.of(context).size.height * 0.045,
                ),
                onPressed: () {
                  callpage(i,context,k);
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.02,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.009),
                  child: Text(
                    st,
                    style: TextStyle(
                        // color: Color(0xff132137),
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromARGB(255, 42, 94, 68),
                ),
                onPressed: () {
                 callpage(i,context,k);
                },
              ),
            ],
          )),
    );
  }
}

void callpage(int i, BuildContext context,int k) {
  if (i == 0) {
    Navigator.push(
        context,
        MaterialPageRoute(
            // builder: (_) => profile(

            //       firstlist: [id],
            //     )
             builder: (_) => edit_profile_page(firstlist: [k],)
             
                ));}
                 if (i == 3) {
    Navigator.push(
        context,
        MaterialPageRoute(
            //builder: (_) => privacy_page(
               builder: (context) => privacy_page()
                 // firstlist: [id],
            ));
  }
     if (i == 1) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => MyStatefulWidget(
               firstlist: [k],
                )));
  }
  // } else if (i == 1) {
  //   Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //           builder: (_) => info_page(
  //                 firstlist: [id],
  //               )));
  // }
   if (i == 2) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => resete_password_page(
                  firstlist: [k],
                )));
   }
 
  if (i == 4) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => notification_page(
                  firstlist: [],
                )));
  }
}
