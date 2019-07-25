import 'dart:convert';
import 'package:http/http.dart';


abstract class HttpService{
  
  Future<Map<String,dynamic>> makeQuery(String query) async{
  final response = await get(query);
  final decodedArray = json.decode(response.body);
  return decodedArray;
}


}
