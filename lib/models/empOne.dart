
import 'package:pars_work/models/employe.dart';

class EmpOne{
  String? status;
  String? message;
  Employee data;

  Map<String,dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson()
  };

  EmpOne.fromJson(Map<String,dynamic> json)
  : status = json['status'],
    message = json['message'],
    data = Employee.fromJson(json['data']);
}