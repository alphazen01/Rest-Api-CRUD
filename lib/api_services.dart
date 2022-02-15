

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


}
