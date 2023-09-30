import 'package:flutter/material.dart';

import '../notes.dart';

final TextEditingController titleC = TextEditingController();
final TextEditingController contentC = TextEditingController();
late String title;
late String content;
late String time;
late int Index;
int chosenIndex = 0;

class createNote extends StatefulWidget {
  const createNote({
    Key? key,
  }) : super(key: key);

  @override
  State<createNote> createState() => _CreatNoteState();
}

class _CreatNoteState extends State<createNote> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const BackButton(),
          title: const Text("Ghi Chú"),
        ),
        backgroundColor: colors[chosenIndex],
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
                autofocus: true,
                textInputAction: TextInputAction.next,
                controller: titleC,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w500),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Title",
                    hintStyle: TextStyle(color: Colors.white))),
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
                textInputAction: TextInputAction.newline,
                controller: contentC,
                maxLines: 20,
                showCursor: true,
                style: const TextStyle(color: Colors.white, fontSize: 24),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    constraints: BoxConstraints.expand(height: 400, width: 200),
                    hintText: "Ghi nội dung ghi chú...",
                    hintStyle: TextStyle(color: Colors.white))),
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
                    itemBuilder: (BuildContext context, Index) =>
                        GestureDetector(
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
                time = DateTime.now().toString();
                title = titleC.text;
                content = contentC.text;
                titleC.text != "" || contentC.text != ""
                    ? {
                        await insertToDatabase(
                            title: title,
                            time: time,
                            content: content,
                            index: chosenIndex),
                        titleC.text = "",
                        contentC.text = "",
                        Navigator.pop(context)
                      }
                    : Navigator.pop(context);
              },
              child: const Text(
                "Lưu",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          )
        ])),
      ),
    );
  }
}
