
import 'dart:convert';

import "package:http/http.dart" as http;

class RequestResult
{
  bool ok;
  dynamic data;
  RequestResult(this.ok, this.data);
}

const PROTOCOL = "http";

//const DOMAIN = "172.19.134.76:8000";//uni
//const DOMAIN = "192.168.1.193:8000";//nbls
const DOMAIN = "192.168.1.121:8000";//hom


Future<RequestResult> http_get(String route, [dynamic data]) async
{
  var dataStr = jsonEncode(data);
  var url = "$PROTOCOL://$DOMAIN/$route?data=$dataStr";
  var result = await http.get(Uri.parse(url));
  return RequestResult(true, jsonDecode(result.body));
}
Future<RequestResult> http_post(String route, [dynamic data]) async
{
  //"http://192.168.1.109:8000/$route"
  var url = "$PROTOCOL://$DOMAIN/$route";
  var dataStr = jsonEncode(data);
    print(dataStr);

 
 var result = await http.post(Uri.parse(url), body: dataStr, headers:{"Content-Type":"application/json"});
  return RequestResult(true, jsonDecode(result.body));

}