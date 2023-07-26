import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notes_app_me/app/model/note_model.dart';
import 'package:notes_app_me/app/viewmodel/home_viewmodel.dart';
import 'package:notes_app_me/src/utils/color_convert.dart';
import 'package:notes_app_me/src/utils/consts.dart';
import 'package:provider/provider.dart';

class PreviewNote extends StatelessWidget {
  final NoteModel? prevNote;
  const PreviewNote({Key? key, required this.prevNote}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeVM = Provider.of<HomeViewModel>(context);
    return Stack(
      children: [
        Container(
            decoration: BoxDecoration(
              color: colorConvert(prevNote!.color!)!.withOpacity(0.4),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Text(prevNote!.title!,
                        style: TextStyle(
                            color: colorConvert(prevNote!.color!),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      const Text('Tasks',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              decoration: TextDecoration.lineThrough)),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.remove_circle_outline,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text('Tasks',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              decoration: TextDecoration.lineThrough)),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            colorConvert(prevNote!.color!)!.withOpacity(0.3),
                        elevation: 0.0,
                        side: BorderSide(
                          width: 0.5,
                          color: colorConvert(prevNote!.color!)!,
                        ),
                        textStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.alarm_on_sharp,
                          color: secondColor,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text('Sund, 8:00',
                            style:
                                TextStyle(color: secondColor, fontSize: 10.0)),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            colorConvert(prevNote!.color!)!.withOpacity(0.3),
                        elevation: 0.0,
                        side: BorderSide(
                          width: 0.5,
                          color: colorConvert(prevNote!.color!)!,
                        ),
                        textStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    child: const Row(
                      children:[
                        Icon(
                          Icons.multitrack_audio_sharp,
                          color: secondColor,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text('Audio',
                            style:
                                TextStyle(color: secondColor, fontSize: 10.0)),
                      ],
                    ),
                  ),
                ],
              ),
            )),
        Positioned(
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                  onTap: () => alertDialogMe(context, homeVM),
                  // homeVM.deleteNoteById(prevNote!.id!),
                  child: const Icon(
                    Icons.cancel_sharp,
                    color: secondColor,
                    size: 25.0,
                  )),
            )),
      ],
    );
  }

  Future<dynamic> alertDialogMe(BuildContext context, HomeViewModel homeVM) {
    return showDialog(
                    context: context,
                    builder: (BuildContext context) => BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: AlertDialog(
                            title: const Text("Eliminar Nota"),
                            content: const Text(
                                "¿Esta seguro de eliminar esta nota?"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, "Cancel"),
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                  onPressed: () {
                                    homeVM.deleteNoteById(prevNote!.id!);
                                    log("Nota eliminada, id: ${prevNote!.id!}",time: DateTime.now());
                                    Navigator.pop(context, "Ok");
                                  },
                                  child: const Text("Ok"))
                            ],
                          ),
                        ));
  }

  dialogConfirm() {}
}
