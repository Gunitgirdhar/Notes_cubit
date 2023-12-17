import 'NOTEMODAL.dart';

 abstract class BlocState{}

class InitialState extends BlocState{}

  class LoadedState extends BlocState{
  List<NoteModel> arrNotes;
  LoadedState({required this.arrNotes});
  }

  class isLoadingState extends BlocState{}

  class ErrorState extends BlocState{
  String errorMessage;
  ErrorState({required this.errorMessage});
  }

