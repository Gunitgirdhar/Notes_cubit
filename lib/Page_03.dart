import 'package:flutter/material.dart';
import 'package:notes_cubit/page_02.dart';

import 'Page_04.dart';

class DataShowing extends StatefulWidget {
  String mtitle;
  String mbody;
  int? index;
  DataShowing({required this.mtitle,required this.mbody,this.index});

  @override
  State<DataShowing> createState() => _DataShowingState();
}

class _DataShowingState extends State<DataShowing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(30),
          height: 800,
          width: 600,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade500
          ),
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateData(updateBody: widget.mbody,updateTitle: widget.mtitle,indexUpdate: widget.index,),));
                  },
                    child: Icon((Icons.edit_calendar_sharp)))
              ],),
              Text(" Notes",style: TextStyle(color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              )),
              SizedBox(height: 60,),
              Container(
                padding: EdgeInsets.all(12),
                height: 200,
                width: 275,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black),
                ),
                child: Center(child: Text("${widget.mtitle}",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                )),
              ),

              SizedBox(height: 50,),
              Container(
                padding: EdgeInsets.all(12),
                height: 200,
                width: 275,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black),
                ),
                child: Center(child: Text("${widget.mbody}",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                )),
              ),
              

            ],
          )
      ),


    );
  }
}
