import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:notes_cubit/AppDatabase.dart';
import 'package:notes_cubit/NOTEMODAL.dart';
import 'package:notes_cubit/cubitEvent.dart';
import 'package:notes_cubit/cubitList.dart';
import 'package:notes_cubit/cubitState.dart';
import 'package:notes_cubit/page_02.dart';

import 'Page_03.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DataFirstPage extends StatefulWidget {
  const DataFirstPage({super.key});

  @override
  State<DataFirstPage> createState() => _DataFirstPageState();
}

class _DataFirstPageState extends State<DataFirstPage> {
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BlocList, BlocState>(
        builder: (context, state) {
          if (state is isLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is LoadedState) {
            return SafeArea(
              child: Column(
                children: [
                  Text("Personal Notes",
                  style: TextStyle(fontSize: 30
                  ),
                  ),
          GridView.builder(
          shrinkWrap: true,
          itemCount: state.arrNotes.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2),
          itemBuilder: (context, index) {
            print(index);
          return Stack(
          children: [
          InkWell(
          onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => DataShowing(mtitle: "${state.arrNotes[index].title}",mbody: "${state.arrNotes[index].desc}",index: state.arrNotes[index].note_id!,),));
          },
          child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
          color: Colors.primaries[
          Random().nextInt(Colors.primaries.length)],
          borderRadius: BorderRadius.circular(17),
          border: Border.all(color: Colors.black),
          boxShadow: [BoxShadow(blurRadius: 4)]),

          //height: 20,
          child: Center(
          child: Text("${state.arrNotes[index].title}")),
          ),
          ),
          Align(
          alignment: Alignment.bottomRight,
          child: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 15, 15),
          child: InkWell(
          onTap: (){
          context.read<BlocList>().add(DeletingNotes(index: state.arrNotes[index].note_id!));
          },
          child: Icon((Icons.delete),size: 26,color: Colors.black45,))))
          ],
          );
          },
          )
                ],
              ),
            );



          } else {
            return Container();
          }
        },
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateingData(),));
        },
        child:Icon(Icons.add) ,
      ),
    );
  }
}
