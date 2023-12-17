import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_cubit/AppDatabase.dart';
//import 'package:notes_cubit/NOTEMODAL.dart';
import 'package:notes_cubit/cubitEvent.dart';
import 'package:notes_cubit/cubitState.dart';

class BlocList extends Bloc<BlocEvent,BlocState>{
  AppDataBase db;
  BlocList({required this.db}):super(InitialState()){
    on<AddingNotes>((event, emit) async{
      emit(isLoadingState());
      bool check=await db.Addnote(event.addNotes );
      if(check){
        var data=await db.fetchNote();
      emit(LoadedState(arrNotes: data));
      }
      else{
        emit(ErrorState(errorMessage: "Note not added"));
      }
    });
    on<getNotes>((event, emit)async{
      emit(isLoadingState());
      var notes= await db.fetchNote();
      emit(LoadedState(arrNotes: notes));
    });
    on<DeletingNotes>((event, emit)async{
      //emit(isLoadingState());
      var check=await db.deleteNote(event.index);
      if(check){
        var datadeleted=await db.fetchNote();
       emit(LoadedState(arrNotes: datadeleted));
      }
    });
    on<UpdatingNotes>((event, emit) async{
      //emit( isLoadingState());
      var check=await db.updateNote(event.updateNote);
      if(check){
        var updatedData=await db.fetchNote();
        emit(LoadedState(arrNotes: updatedData));
      }
      else{
        emit(ErrorState(errorMessage: "Notes not added"));
      }
    });
  }

  }




