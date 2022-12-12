import 'package:bubble/bubble.dart';
import 'package:dialogflow_flutter/googleAuth.dart';
import 'package:flutter/material.dart';
import 'package:dialogflow_flutter/dialogflowFlutter.dart';

class ChatDetailPage  extends StatefulWidget {
 @override
   List firstlist;
  ChatDetailPage({Key? key, required this.firstlist}) : super(key: key);
  _ChatDetailPageState createState() => _ChatDetailPageState();
}
    
class _ChatDetailPageState extends State<ChatDetailPage> {
 
//   var growableList = List();
// messsages.length; // 0;
// messsages.length = 3;
   List textfieldsStrings2 = [
    "", 
    "", 
    "", 
    "", 
  
  ];
  Future<void> response(query) async {
      //List<Map> messsages = [];

    AuthGoogle authGoogle = await AuthGoogle(
            fileJson: "assets/med-aid-chat-nyyh-017864bd301a.json")
        .build();
     DialogFlow dialogflow =
          DialogFlow(authGoogle: authGoogle, language: "en");
    
        print(query);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
     //   print(aiResponse2.toString());
   //  aiResponse = aiResponse2;
    //  if (aiResponse == null) return;
    //  else{
    setState(() {
       messsages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
      
      });
    
    });
    //}
     print(aiResponse.getListMessage()[0]["text"]["text"][0].toString());
  }
  final messageInsert = TextEditingController();
   // ignore: prefer_collection_literals, deprecated_member_use
  // List<dynamic> messsages=[];
   List<Map<String, dynamic>> messsages= <Map<String, dynamic>>[] ;
//List< String> messsages=List();
// ignore: prefer_collection_literals, deprecated_member_use, unnecessary_new



//List< String> messsages=List as List<String>;
  // List<Map<String, dynamic>> list = [];
  //final List<ChatMessage> _messages = <ChatMessage>[];
   // List<Map<String, dynamic>> messsages = [];//..length = 500;
  //List<Map> messsages = [];//..length = 500;
 //List< String> messsages=List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "pharmacy chat",
        ),
       backgroundColor:  Color(0xFF91c4aa),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) => chat(
                        messsages[index]["message"].toString(),
                        messsages[index]["data"]))),
            Divider(
              height: 5.0,
              color: Color.fromARGB(255, 50, 100, 54),
            ),
            Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                      child: TextField(
                    controller: messageInsert,
                    decoration: InputDecoration.collapsed(
                        hintText: "Send your message",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                  )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: IconButton(
                      
                        icon: Icon(
                          
                          Icons.send,
                          size: 30.0,
                          color: Color.fromARGB(255, 47, 97, 64),
                        ),
                        onPressed: () {
                          if (messageInsert.text.isEmpty) {
                            print("empty message");
                          } else {
                            setState(() {
                              messsages.insert(0,
                                  {"data": 1, "message": messageInsert.text});
                            });
                            response(messageInsert.text);
                            messageInsert.clear();
                          }
                        }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  //for better one i have use the bubble package check out the pubspec.yaml

  Widget chat(String message, int data) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Bubble(
          radius: Radius.circular(15.0),
          color: data == 0 ? Color.fromARGB(255, 36, 95, 76) : Color(0xFF91c4aa),
          elevation: 0.0,
          alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
          nip: data == 0 ? BubbleNip.leftBottom : BubbleNip.rightTop,
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(
                      data == 0 ? "assets/images/bot.png" : "assets/images/usr-removebg-preview.png"),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Flexible(
                    child: Text(
                  message,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))
              ],
            ),
          )),
    );
  }
}
