import 'package:flutter/material.dart';

import '../notes.dart';

final TextEditingController titleC = TextEditingController();
final TextEditingController contentC = TextEditingController();
late int Index;
int chosenIndex = 0;

// ignore: must_be_immutable
class EditNote extends StatefulWidget {
  String Title = "";
  String Content = "";
  int index = 0;

  EditNote(
      {Key? key,
      required this.Title,
      required this.Content,
      required this.index})
      : super(key: key);

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  @override
  void initState() {
    super.initState();
    titleC.text = widget.Title;
    contentC.text = widget.Content;
    Index = widget.index;
    chosenIndex = Index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[chosenIndex],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(),
        title: const Text("Ghi Chú"),
      ),
      body: SafeArea(
          child: ListView(children: [
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
              maxLines: 2,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.done,
              controller: titleC,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w500),
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Tiêu đề")),
        ),
        const Divider(
            color: Colors.white, thickness: 2, endIndent: 20, indent: 20),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
              cursorColor: Colors.white,
              textInputAction: TextInputAction.done,
              controller: contentC,
              maxLines: 15,
              showCursor: true,
              style: const TextStyle(color: Colors.white, fontSize: 24),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  constraints: BoxConstraints.expand(height: 400, width: 200),
                  hintText: "Nhập nội dung ở đây...")),
        ),
        FittedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: 60,
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: colors.length,
                  itemBuilder: (BuildContext context, Index) => GestureDetector(
                    onTap: () {
                      chosenIndex = Index;
                      setState(() {});
                    },
                    child: CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: colors[Index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
          child: TextButton(
            onPressed: () async {
              var time = DateTime.now().toString();
              titleC.text != widget.Title ||
                      contentC.text != widget.Content ||
                      chosenIndex != widget.index
                  ? {
                      await editDatabaseItem(
                          time: time,
                          content: contentC.text,
                          title: widget.Title,
                          title2: titleC.text,
                          index: chosenIndex),
                      Navigator.of(context).pop(),
                    }
                  : Navigator.of(context).pop();
            },
            child: Container(
              width: 150,
              height: 50,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Cập nhật",
                style: TextStyle(fontSize: 25, color: colors[chosenIndex]),
              ),
            )
          ),
        )
      ])),
    );
  }
}
