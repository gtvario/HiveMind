import 'package:flutter/material.dart';
import 'package:hivemind/models/scout_data_model.dart';

class Note extends StatefulWidget {
  final int notePos;
  final ScoutData scoutData;
  const Note({super.key, required this.scoutData, required this.notePos});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  bool _checked = false;
  List<int> _fieldNotes = [0, 0, 0, 0, 0, 0, 0, 0];
  Image _image_path = Image.asset('assets/images/note.png');

  @override
  void initState() {
    super.initState();
    _fieldNotes = widget.scoutData.getFieldPickupAuto;
    setState(() {
      _checked = _fieldNotes[widget.notePos] == 1;
      if (_checked) {
        _image_path = Image.asset('assets/images/note_attempted.png');
      } else {
        _image_path = Image.asset('assets/images/note.png');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        //your image is here
        child: _image_path,
        onTapDown: (tap) {
          setState(() {
            if (!_checked) {
              _image_path = Image.asset('assets/images/note_attempted.png');
              _checked = true;
              widget.scoutData.setFieldPickupAuto = [widget.notePos, 1];
            } else {
              _image_path = Image.asset('assets/images/note.png');
              _checked = false;
              widget.scoutData.setFieldPickupAuto = [widget.notePos, 0];
            }
          });
        },
      )
    ]);
  }
}
