import 'package:flutter/material.dart';
import 'package:notes_app_me/app/viewmodel/note_viewmodel.dart';
import 'package:notes_app_me/src/utils/consts.dart';
import 'package:notes_app_me/src/widgets/edit_bar.dart';
import 'package:provider/provider.dart';

class NoteView extends StatefulWidget {
  static String routeName = '/note';
  const NoteView({super.key});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  // static List<String> friendsList = [""];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteViewModel(context),
      child: _Content(context),
    );
  }

  // Widget buildContainer() {
  //   return Container(
  //     width: double.infinity,
  //     height: 300.0,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(50.0),
  //       color: secondColor,
  //     ),
  //   );
  // }

  // Widget taskComplete(String text) {
  //   return Row(
  //     children: [
  //       const Icon(
  //         Icons.check_box,
  //         color: pinkRedColor,
  //       ),
  //       const SizedBox(
  //         width: 20.0,
  //       ),
  //       Text(text,
  //           style: const TextStyle(
  //               color: blackLighColor,
  //               fontSize: 15.0,
  //               decoration: TextDecoration.lineThrough)),
  //     ],
  //   );
  // }

  // Widget taskPending(String text) {
  //   return Row(
  //     children: [
  //       const Icon(
  //         Icons.check_box_outline_blank_sharp,
  //         color: pinkRedColor,
  //       ),
  //       const SizedBox(
  //         width: 20.0,
  //       ),
  //       Text(text,
  //           style: const TextStyle(color: blackLighColor, fontSize: 15.0)),
  //     ],
  //   );
  // }

  // List<Widget> _getItems() {
  //   List<Widget> friendsTextFieldsList = [];

  //   for (int i = 0; i < friendsList.length; i++) {
  //     print(i);
  //     friendsTextFieldsList.add(Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 16.0),
  //       child: Column(
  //         children: [
  //           Row(
  //             children: [
  //               Expanded(child: ItemDynamic(index: i)),
  //             ],
  //           ),
  //           const SizedBox(
  //             height: 16,
  //           ),
  //           _addRemoveButton(i == friendsList.length - 1, i),
  //         ],
  //       ),
  //     ));
  //   }
  //   return friendsTextFieldsList;
  // }

  // Widget _addRemoveButton(bool add, int index) {
  //   return InkWell(
  //     onTap: () {
  //       if (add) {
  //         // add new text-fields at the top of all friends textfields
  //         friendsList.insert(0, "");
  //       } else {
  //         friendsList.removeAt(index);
  //       }
  //       setState(() {});
  //     },
  //     child: Container(
  //       width: 30,
  //       height: 30,
  //       decoration: BoxDecoration(
  //         color: (add) ? Colors.green : Colors.red,
  //         borderRadius: BorderRadius.circular(20),
  //       ),
  //       child: Icon(
  //         (add) ? Icons.add : Icons.remove,
  //         color: Colors.white,
  //       ),
  //     ),
  //   );
  // }
}

class _Content extends StatelessWidget {
  const _Content(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final noteViewModel = Provider.of<NoteViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70.0,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                          onChanged: (value) => noteViewModel.title = value,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            filled: false,
                            fillColor: secondColor,
                            hintText: 'Enter your Title',
                            hintStyle:
                                TextStyle(color: secondColor, fontSize: 35.0),
                          ),
                          style: const TextStyle(
                              color: navyColor,
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        'Domingo, 10:24 | 4096 caracteres | Ultimo cambio: Sabado, 11:22',
                        style: TextStyle(
                            color: greyColor, fontWeight: FontWeight.bold),
                      ),
                      // Column(
                      //   children: _getItems(), //Futura Mejora
                      // ),
                      TextFormField(
                        onChanged: (value) => noteViewModel.content = value,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          filled: false,
                          fillColor: secondColor,
                          hintText: 'Escribe tu nota, agrege tus tareas, etc',
                          hintStyle: TextStyle(
                            color: secondColor,
                          ),
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        style: const TextStyle(
                            color: navyColor, fontWeight: FontWeight.w400),
                        validator: (v) {
                          if (v!.trim().isEmpty) {
                            return 'Porfavor ingresa algo';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: EditBarCustom(
              label: "Guardar",
              onPressed: () => noteViewModel.newNote(context)),
        )),
        // const MenuBottomSheet(),
      ])),
    );
  }
}

// class ItemDynamic extends StatefulWidget {
//   final int index;
//   const ItemDynamic({Key? key, required this.index}) : super(key: key);

//   @override
//   _ItemDynamicState createState() => _ItemDynamicState();
// }

// class _ItemDynamicState extends State<ItemDynamic> {
//   TextEditingController? _nameContoller;

//   @override
//   void initState() {
//     super.initState();
//     _nameContoller = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _nameContoller!.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       _nameContoller!.text = _NoteViewState.friendsList[widget.index];
//     });
//     return TextFormField(
//       controller: _nameContoller,
//       onChanged: (v) => _NoteViewState.friendsList[widget.index] = v,
//       decoration: const InputDecoration(
//         border: InputBorder.none,
//         focusedBorder: InputBorder.none,
//         enabledBorder: InputBorder.none,
//         errorBorder: InputBorder.none,
//         disabledBorder: InputBorder.none,
//         filled: false,
//         fillColor: secondColor,
//         hintText: 'Escribe tu nota, Agrega tus tareas, etc',
//         hintStyle: TextStyle(
//           color: secondColor,
//           // fontSize: 10.0
//         ),
//       ),
//       maxLines: null,
//       keyboardType: TextInputType.multiline,
//       style: const TextStyle(color: navyColor, fontWeight: FontWeight.bold),
//       validator: (v) {
//         if (v!.trim().isEmpty) return 'Porfavor ingresa algo';
//         return null;
//       },
//     );
//   }
// }
