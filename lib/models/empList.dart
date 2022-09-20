
import 'employe.dart';

class EmpList{

  String? status;
  String? message;
  List<Employee> data = [];

  Map<String,dynamic> toJson() => {
     'status':status,
      'message':message,
      'data': List<Employee>.from(data.map((e) => e.toJson()))
  };

  EmpList.fromJson(Map<String,dynamic> json)
  : status = json['status'],
    message = json['massege'],
    data = List<Employee>.from(json['data'].map((x) => Employee.fromJson(x)));
}