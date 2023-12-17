import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'NOTEMODAL.dart';
import 'cubitEvent.dart';
import 'cubitList.dart';

class UpdateingData extends StatefulWidget {
  const UpdateingData({super.key});

  @override
  State<UpdateingData> createState() => _UpdateingDataState();
}

class _UpdateingDataState extends State<UpdateingData> {
  var controller1=TextEditingController();
  var controller2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              labelText: "Title",

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18)
              )
            ),
            ),
            SizedBox(height: 50,),
            TextField(controller: controller2,
              decoration: InputDecoration(
                  hintText: "Enter Body Here",
                  labelText: "Body",

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)
                  )
              ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              var title=controller1.text.toString();
              var desc=controller2.text.toString();
              context.read<BlocList>().add(AddingNotes(addNotes: NoteModel(title: title, desc: desc,)));
              controller1.clear();
              controller2.clear();
              Navigator.pop(context);
            }, child: Text("Add Notes",style: TextStyle(color: Colors.black),),style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow,elevation: 6,),)
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
