

import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiServices{

final baseUrl="jsonplaceholder.typicode.com";


Future getAlbum()async{
  var response = await http.get(Uri.https("$baseUrl","albums"));

  if (response.statusCode==200) {
    return jsonDecode(response.body);
  } else {
    throw Exception("Faild to load");
  }
}
Future sendAlbum(String title)async{
  var response = await http.post(
    Uri.https("$baseUrl","albums"),
    body: jsonEncode(<String, String>{
      "title":title
    }),
     headers: <String,String>{
       'Content-Type': 'application/json; charset=UTF-8',
     }
    );
   print({"response.statusCode:${response.statusCode}"});
  if (response.statusCode==201) {
    return jsonDecode(response.body);
  } else {
    throw Exception("Faild to load");
  }
}

Future updateAlbum(String title,id)async{
  var response = await http.put(
    Uri.https("$baseUrl","albums/$id"),
    body: jsonEncode(<String, String>{
      "title":title
    }),
     headers: <String,String>{
       'Content-Type': 'application/json; charset=UTF-8',
     }
    );
   print({"response.statusCode:${response.statusCode}"});
  if (response.statusCode==200) {
    return jsonDecode(response.body);
  } else {
    throw Exception("Faild to load");
  }
}
Future deleteAlbum(id)async{
  var response = await http.delete(
    Uri.https("$baseUrl","albums/$id"),
   
     headers: <String,String>{
       'Content-Type': 'application/json; charset=UTF-8',
     }
    );
   print({"response.statusCode:${response.statusCode}"});
  if (response.statusCode==200) {
    return true;
  } else {
    throw false;
  }
}


}
