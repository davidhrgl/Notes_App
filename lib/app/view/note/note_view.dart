import 'package:flutter/material.dart';
import 'package:notes_app_me/src/utils/consts.dart';
import 'package:notes_app_me/src/widgets/edit_bar.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  static List<String> friendsList = [""];

  @override
  Widget build(BuildContext context) {
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
                      //   children: _getItems(), //Fura Mejora
                      // ),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          filled: false,
                          fillColor: secondColor,
                          hintText: 'Escribe tu nota, Agrega tus tareas, etc',
                          hintStyle: TextStyle(
                            color: secondColor,
                          ),
                        ),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        style: const TextStyle(color: navyColor, fontWeight: FontWeight.w400),
                        validator: (v) {
                          if (v!.trim().isEmpty) return 'Porfavor ingresa algo';
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
        const Positioned(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: EditBarCustom(),
            )
          ),
        // const MenuBottomSheet(),
      ])),
    );
  }

  Widget buildContainer() {
    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: secondColor,
      ),
    );
  }

  Widget taskComplete(String text) {
    return Row(
      children: [
        const Icon(
          Icons.check_box,
          color: pinkRedColor,
        ),
        const SizedBox(
          width: 20.0,
        ),
        Text(text,
            style: const TextStyle(
                color: blackLighColor,
                fontSize: 15.0,
                decoration: TextDecoration.lineThrough)),
      ],
    );
  }

  Widget taskPending(String text) {
    return Row(
      children: [
        const Icon(
          Icons.check_box_outline_blank_sharp,
          color: pinkRedColor,
        ),
        const SizedBox(
          width: 20.0,
        ),
        Text(text,
            style: const TextStyle(color: blackLighColor, fontSize: 15.0)),
      ],
    );
  }

  List<Widget> _getItems() {
    List<Widget> friendsTextFieldsList = [];

    for (int i = 0; i < friendsList.length; i++) {
      print(i);
      friendsTextFieldsList.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: ItemDynamic(index: i)),
              ],
            ),
            const SizedBox(height: 16,),
            _addRemoveButton(i == friendsList.length - 1, i),
          ],
        ),
      ));
    }
    return friendsTextFieldsList;
  }

  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the top of all friends textfields
          friendsList.insert(0, "");
        } else {
          friendsList.removeAt(index);
        }
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ItemDynamic extends StatefulWidget {
  final int index;
  const ItemDynamic({Key? key, required this.index}) : super(key: key);

  @override
  _ItemDynamicState createState() => _ItemDynamicState();
}

class _ItemDynamicState extends State<ItemDynamic> {
  TextEditingController? _nameContoller;

  @override
  void initState() {
    super.initState();
    _nameContoller = TextEditingController();
  }

  @override
  void dispose() {
    _nameContoller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameContoller!.text = _NoteScreenState.friendsList[widget.index];
    });
    return TextFormField(
      controller: _nameContoller,
      onChanged: (v) => _NoteScreenState.friendsList[widget.index] = v,
      decoration: const InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        filled: false,
        fillColor: secondColor,
        hintText: 'Escribe tu nota, Agrega tus tareas, etc',
        hintStyle: TextStyle(
          color: secondColor,
          // fontSize: 10.0
        ),
      ),
      maxLines: null,
      keyboardType: TextInputType.multiline,
      style: const TextStyle(color: navyColor, fontWeight: FontWeight.bold),
      validator: (v) {
        if (v!.trim().isEmpty) return 'Porfavor ingresa algo';
        return null;
      },
    );
  }
}
