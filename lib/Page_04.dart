import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_cubit/NOTEMODAL.dart';
import 'package:notes_cubit/cubitEvent.dart';

import 'Page_01.dart';
import 'cubitList.dart';

class UpdateData extends StatefulWidget {
 String updateTitle;
 String updateBody;
 int? indexUpdate;
 UpdateData({required this.updateBody,required this.updateTitle, this.indexUpdate});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  var controller1=TextEditingController();
  var controller2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
          padding: EdgeInsets.all(30),
          height: 800,
          width: 600,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.yellow
          ),
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            children: [
              Text("Adding Notes",style: TextStyle(color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              )),
              SizedBox(height: 60,),
              TextField(controller: controller1,
                decoration: InputDecoration(
                    hintText: "Enter Title Here",
                    labelText: "Update Title",

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)
                    )
                ),
              ),
              SizedBox(height: 50,),
              TextField(controller: controller2,
                decoration: InputDecoration(
                    hintText: "Enter Body Here",
                    labelText: "Update Body",

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18)
                    )
                ),
              ),
              SizedBox(height: 50,),
              ElevatedButton(onPressed: (){
                var title=controller1.text.toString();
                var desc=controller2.text.toString();
                context.read<BlocList>().add(UpdatingNotes(updateNote: NoteModel(title:title  , desc:desc ,note_id: widget.indexUpdate)));
               /* add(AddingNotes(addNotes: NoteModel(title: title, desc: desc)));*/
                controller1.clear();
                controller2.clear();
                Navigator.push(context, MaterialPageRoute(builder: (context) => DataFirstPage(),));
              }, child: Text("Update Notes",style: TextStyle(color: Colors.black),),style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow,elevation: 6,),)
            ],
          )
      ),













      /////////////////////////////
      /*   floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context) {
            return   Column(
              children: [
                TextField(controller: controller1,),
                TextField(controller: controller2,),
                ElevatedButton(onPressed: (){
                  var title=controller1.text.toString();
                  var desc=controller2.text.toString();
                  context.read<BlocList>().add(AddingNotes(addNotes: NoteModel(title: title, desc: desc)));
                  controller1.clear();
                  controller2.clear();
                }, child: Text("Save"))
              ],
            );
          },);
        },
        child: Icon(Icons.add),
      ),*/
    );
  }
}
