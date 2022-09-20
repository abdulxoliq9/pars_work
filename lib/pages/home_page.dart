//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:pars_work/models/empList.dart';
import 'package:pars_work/models/employe.dart';
import 'package:pars_work/pages/detail_page.dart';
import 'package:pars_work/services/network.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = 'home_page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> items = [];
  void empList(){
    Network.GET(Network.API_EMP_LIST, Network.paramsEmpty())
        .then((response) => {
    print(response),
      showRes(response),
    });
  }

  void showRes(String response){
    EmpList empL = Network.parsEmplist(response);
    setState(() {
      items = empL.data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    empList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, i){
          return ItemOfList(items[i]);
        },
      ),
    );
  }

  Widget ItemOfList(Employee emp){
    return GestureDetector(
      onTap: (){
        print('cliced');
        Navigator.pushReplacementNamed(context, DetailPage.id);
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(emp.employee_name! +'('+emp.employee_age.toString()+")",style:
              TextStyle(fontSize: 20,color: Colors.black),),
            SizedBox(height: 10,),
            Text(emp.employee_salary.toString()+'\$',style: TextStyle(fontSize: 18),)
          ],
        ),
      ),
    );
  }
}
