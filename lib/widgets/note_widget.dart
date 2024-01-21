import 'package:flutter/material.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  bool _checked = false;
  Image _image_path = Image.asset('assets/images/note.png');

  @override
  void initState() {
    super.initState();
    setState(() {});
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
              _image_path = Image.asset('assets/images/checkmark.png');
              _checked = true;
            } else {
              _image_path = Image.asset('assets/images/note.png');
              _checked = false;
            }
          });
        },
      )
    ]);
  }
}
