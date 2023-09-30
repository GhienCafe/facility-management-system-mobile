import 'package:FMS/view/note/widget/note.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../res/color/colors.dart';

late Database database;
List<Map> notesMap = [];
List<Color> colors = [
  Colors.amber,
  const Color(0xfff77b85),
  const Color(0xffff8b34),
  const Color(0xff66c6c2),
  const Color(0xfff169a7),
];
late int viewIndex;
bool loading = true;
late bool showDate;
late bool showShadow;

class Note extends StatefulWidget {
  const Note({Key? key}) : super(key: key);

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  startPage() async {
    await startDatabase();
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    startPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : FutureBuilder(
        future: startDatabase(),
        builder: (context, snapshot) => NotePage(),
      ),
    );
  }
}

Widget customAppBar(String title, double top, [Widget? leading]) {
  return Column(
    children: [
      Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFACCCC), Color(0xFFF6EFE9)],
            )
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 25, fontWeight: FontWeight.w500,
                  color: AppColor.primaryColor,
                  letterSpacing: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: leading ?? Container(),
              )
            ],
          ),
        ),
      ),
      // const Divider(
      //   height: 20,
      //   thickness: 2,
      //   color: Colors.black12,
      // ),
    ],
  );
}

Future<void> startDatabase() async {
  final prefs = await SharedPreferences.getInstance();
  await openDatabase('notes.db', version: 1, onCreate: (db, version) async {
    print("db created");
    await db.execute(
        'CREATE TABLE Notes (id INTEGER PRIMARY KEY, title TEXT, content TEXT, time Text, cindex INTEGER, tindex INTEGER,edited Text)');
  }, onOpen: (db) async {
    print("db opened");
  }).then((value) => database = value);
  viewIndex = await prefs.getInt('viewIndex') ?? 0;
  showDate = await prefs.getBool('showDate') ?? true;
  showShadow = await prefs.getBool('showShadow') ?? true;
  await refreshDatabase();
}

Future<void> refreshDatabase() async {
  await getDatabaseItems(database);
}

Future<void> destroyDatabase() async {
  await deleteDatabase('notes.db');
  await refreshDatabase();
}

Future<void> insertToDatabase(
    {required String title,
      required String content,
      required int index,
      required String time}) async {
  await database.transaction((txn) async {
    int tIndex = 0;
    txn
        .rawInsert(
        'INSERT INTO Notes(title, content, cindex, tindex, time, edited) VALUES("$title", "$content", "$index", "$tIndex","$time","no")')
        .then((value) {
      print('inserted: $value');
    });
  });
  await refreshDatabase();
}

Future<void> getDatabaseItems(database) async {
  List<Map> list = await database.rawQuery('SELECT * FROM Notes');
  notesMap = await list;
}

Future<void> editDatabaseItem(
    {required String title,
      required String content,
      required String time,
      required int index,
      required String title2}) async {
  int tIndex = 0;
  int count = await database.rawUpdate(
      'UPDATE Notes SET title = ?, content = ?, time = ?, cindex = ?, tindex = ?, edited = ? WHERE title = ?',
      ['$title2', '$content', '$time', '$index', '$tIndex', 'yes', '$title']);
  print('updated: $count');
  await refreshDatabase();
}

Future<void> deleteFromDatabase({required int id}) async {
  int count =
  await database.rawDelete('DELETE FROM Notes WHERE id = ?', ['$id']);
  assert(count == 1);
  await refreshDatabase();
}

