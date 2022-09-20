import 'package:flutter/material.dart';
import 'package:pars_work/models/empOne.dart';
import 'package:pars_work/models/employe.dart';
import 'package:pars_work/pages/home_page.dart';
import 'package:pars_work/services/network.dart';

import '../models/empOne.dart';
class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);
  static final String id = 'detail_page';
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
   Employee data = null!;

  EmplOne(int id){
    Network.GET(Network.API_EMP_ONE+id.toString(), Network.paramsEmpty())
        .then((response) => {
          print(response),
        showRes(response)
    });
  }

  showRes(String response){
    EmpOne emp = Network.parsOne(response);
    setState(() {
      data = emp.data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EmplOne(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, HomePage.id);
          },
            child: Center(
              child: Container(
                child: Column(
                children: [
                  Text('Name: ${data.employee_name}'),
                  SizedBox(height: 10,),
                  Text('Age: ${data.employee_age.toString()}'),
                  SizedBox(height: 10,),
                  Text('Salary: ${data.employee_salary.toString()}'),
    ],
    ),
    ),
    ),
      ),)
    );
  }
}
