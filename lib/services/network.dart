
import 'dart:convert';

import 'package:http/http.dart';
import 'package:pars_work/models/empList.dart';
import 'package:pars_work/models/empOne.dart';

class Network{
  static String BASE = 'dummy.restapiexample.com';
  static Map<String,String> headers = {
    'Content-Type' : 'application/json; charset=UTF-8'
  };

  /* http api */

  static String  API_EMP_LIST = '/api/v1/employees';
  static String API_EMP_ONE =  "/api/v1/employee/";

  /* http requests */

  static Future<String> GET(String api, Map<String,String> params)async{
    print(api);
    var uri = Uri.http(BASE,api,params);
    var response = await get(uri,headers: headers);
    if(response.statusCode == 200){
      return response.body;
    }return null!;
  }

  // static Future<String> GET_ONE(String api,Map<String,dynamic> params)async{
  //
  // }

  /* http params */

  static Map<String,String> paramsEmpty(){
    Map<String,String> params = Map();
    return params;
  }

  /* http parsing */

  static EmpList parsEmplist(String body){
    dynamic json = jsonDecode(body);
    var data = EmpList.fromJson(json);
    return data;
  }

  static EmpOne parsOne(String body){
    dynamic json = jsonDecode(body);
    var data = EmpOne.fromJson(json);
    return data;
  }

}


