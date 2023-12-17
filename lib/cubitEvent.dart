import 'package:flutter/cupertino.dart';

import 'NOTEMODAL.dart';

abstract class BlocEvent{}

class AddingNotes extends BlocEvent{
  NoteModel addNotes;
  AddingNotes({required this.addNotes});
}
class DeletingNotes extends BlocEvent{
  int index;
  DeletingNotes({required this.index});
}
class UpdatingNotes extends BlocEvent{

  NoteModel updateNote;
  UpdatingNotes({required this.updateNote});
}
class getNotes extends BlocEvent{
}