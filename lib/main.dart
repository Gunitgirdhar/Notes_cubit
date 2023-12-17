import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_cubit/AppDatabase.dart';
import 'package:notes_cubit/NOTEMODAL.dart';
import 'package:notes_cubit/Splash%20SCreen.dart';
import 'package:notes_cubit/cubitEvent.dart';
import 'package:notes_cubit/cubitList.dart';
import 'package:notes_cubit/cubitState.dart';
import 'package:notes_cubit/page_02.dart';

import 'Page_01.dart';

void main() {
  runApp(BlocProvider(create: (context)=>BlocList(db: AppDataBase.db),
  child: MyApp(),)
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<BlocList>().add(getNotes());
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:SplashScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
 var controller1=TextEditingController();
 var controller2=TextEditingController();
 /*var controller3=TextEditingController();
 var controller4=TextEditingController();*/
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BlocBuilder<BlocList,BlocState>(builder: (context, state) {
        if( state is isLoadingState ){
         return Center(child: CircularProgressIndicator(),);
        }
        else if(state is ErrorState){
         return Center(child: Text(state.errorMessage),);
        }
        else if(state is LoadedState){
          return ListView.builder(
            itemCount:state.arrNotes.length ,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  controller1.text=state.arrNotes[index].title;
                  controller2.text=state.arrNotes[index].desc;
                  showModalBottomSheet(context: context, builder: (context) {
                    return  Column(
                      children: [
                        TextField(controller: controller1,),
                        TextField(controller: controller2,),
                        ElevatedButton(onPressed: (){
                          var titleupdate=controller1.text.toString();
                          var descUpdate=controller2.text.toString();
                          context.read<BlocList>().add(UpdatingNotes( updateNote: NoteModel(title: titleupdate, desc: descUpdate,note_id: state.arrNotes[index].note_id!)));
                        }, child: Text("Save"))
                      ],
                    );
                  },);                },
                child: ListTile(
                  leading: Text("${index+1}"),
                  title: Text("${state.arrNotes[index].title}"),
                  subtitle: Text("${state.arrNotes[index].desc}"),
                  trailing: InkWell(
                      onTap: (){
                        context.read<BlocList>().add(DeletingNotes(index: state.arrNotes[index].note_id!));
                      },
                      child: Icon(Icons.delete)),

                ),
              );
            },);
        }
        else{
          return Container();
        }

      },),
          floatingActionButton: FloatingActionButton(
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
    child:Icon(Icons.add) ,
    ),
    );
  }
}

