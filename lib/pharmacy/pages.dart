// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:gp1_med_aid/settings/setting%20.dart';
//import 'package:gp1_med_aid/chat/chatai.dart';
import 'package:google_fonts/google_fonts.dart';
import '../http.dart';

 String sug_use="";
List<int> ind = [
  0,1,2
];
List<String> myinfo = [];
String myinfo1="";
String price="";
String type="";
int j=0;

 String des="";

class Page_n extends StatefulWidget {
  @override
  String name=" ";
  String categories;
    String id=" ";
 Page_n({Key? key, required this.name,required this.id,required this.categories}) : super(key: key);
  _PageState createState() => _PageState();

}

  //var sug_use=[];
   var drug_list=[];

class _PageState extends State<Page_n> {

   show_drugs() async {
      var result = await http_get("showdrugs", {
      "id": widget.id,
      "name":widget.categories,
    });
    //if(result.data.toString()!="not found"){
     await setlist(result);
    setState((){
      // for(int i=0;i<myinfo.length;i++)
      //  if(myinfo[i]!="")
      //  drug_list.add(myinfo[i]);
    //  print(drug_list);
   
    });
     print(drug_list);
   
  }

setlist(var res) async{
      drug_list = res.data.split("&");

}
     show_description() async {
      myinfo1=" ";
      var result = await http_get("showdescription", {
      "name": des,
      
    });
    setState(() {
      myinfo1 = result.data;
      print(myinfo1);

    });
  }
     show_price() async {
      price=" ";
      var result = await http_get("showprice", {
      "name": des,
      
    });
    setState(() {
      price= result.data;
      print(price);

    });
  }
  show_type() async {
      type=" ";
      var result = await http_get("showtype", {
      "name": des,
      
    });
    setState(() {
      type= result.data;
      print(type);

    });
  }

   void initState() {
    
     print(widget.categories);
      show_drugs();
      //drug_list=[];
      des="";
    //show_description();
    super.initState();
  }
  // Title List Here
 final ScrollController _scrollController = ScrollController();
AnimationController? animationController;
  @override
  Widget build(BuildContext context) {
       Size size = MediaQuery.of(context).size;
     print(widget.id);
     print(widget.categories);
 return Scaffold(
      appBar: AppBar(
        // App Bar
        title: Text(
         widget.categories,  
          style:TextStyle(color: Color.fromARGB(255, 23, 51, 26),
            fontSize: 25,
                            fontWeight: FontWeight.bold,
          
          
          ),
        ),
       leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color:Color.fromARGB(255, 42, 94, 68),
          ),
          onPressed: () {
            Navigator.pop(context);
            drug_list=[];
          },
        ),
        elevation: 0,
        backgroundColor: Color(0xFF91c4aa),
      ),
      backgroundColor:  Color(0xFF91c4aa),
       body: ListView.builder(
        
        itemCount: drug_list.length,
        itemBuilder: (context, index) {
         
           

          return GestureDetector(
            onTap: () async {
             des=drug_list[index];
                await show_description();
                      await show_price();
                      await show_type();
              // This Will Call When User Click On ListView Item
              showDialogFunc(context, Image.asset("assets/images/drugg.png"),myinfo1,index,price,type);
              
              //showDialogFunc(context);
            },
        
            // Card Which Holds Layout Of ListView Item
            child: Card(
              child: Row(
                
                children: <Widget>[
          
                  Container(
                    width: 100,
                    height: 100,
                        child:  Image.asset("assets/images/drugg.png"),
                      ),
                  

                 
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                         drug_list[index],
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
    

                      ],
                    ),
         
                  )
              
                ],
              ),
            ),
          );
        },
      ),
    );


    
  }}
  showDialogFunc(context, img, title,int i,p,t) {
  return showDialog(
    context: context,
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: EdgeInsets.all(15),
            height: 400,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(5),
                //   child: Image.asset(
                //     img,
                //     width: 200,
                //     height: 200,
                //   ),
                // ),
                    Container(
                  // width: 200,
                  color: Color(0xFF91c4aa),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      drug_list[i],
                      maxLines: 3,
                      style: TextStyle(fontSize: 25, color:  Color.fromARGB(255, 23, 51, 26)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                "description: " ,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 153, 108, 41),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                   Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 41, 87, 75),
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                   Text(
                "price: " ,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 153, 108, 41),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                    Text(
                  p,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 41, 87, 75),
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                "medicine form: " ,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 153, 108, 41),
                    fontWeight: FontWeight.w900,
                  ),
                ),
                    Text(
                  t,
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 41, 87, 75),
                    //fontWeight: FontWeight.bold,
                  ),
                ),
                // Container(
                //   // width: 200,
                //   child: Align(
                //     alignment: Alignment.center,
                //     child: Text(
                //       desc,
                //       maxLines: 3,
                //       style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      );
    },
  );
}