import 'package:FMS/res/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../notes.dart';
import 'create_note.dart';
import 'edit_note.dart';

bool noTitle = false;
bool noContent = false;
bool searchOn = false;
Map<String, int> viewModes = {"Large View": 0, "Long View": 1, "Grid View": 2};
List<Map> searchedNotes = [];
final TextEditingController searchC = TextEditingController();

class NotePage extends StatefulWidget {
  NotePage({Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  Widget leading() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(
                    MaterialPageRoute(builder: (context) => const createNote()),
                  )
                  .then((_) => setState(() {}));
            },
            icon: const Icon(
              Icons.add,
              color: AppColor.whiteColor,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                searchOn = !searchOn;
                searchNotes(searchC.text);
              });
            },
            icon: Icon(
              Icons.search,
              size: 30,
              color: searchOn ? const Color(0xffff8b34) : AppColor.whiteColor,
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (value) async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setInt("viewIndex", viewModes[value]!);
              setState(() {
                viewIndex = viewModes[value]!;
              });
            },
            itemBuilder: (BuildContext context) {
              return {"Large View", "Long View", "Grid View"}
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(
                    choice,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }

  Widget nListView(
      List<Map> Notes, int reverseIndex, int dateValue, String date) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: showShadow ? 2 : 0),
        child: Stack(alignment: Alignment.topRight, children: [
          GestureDetector(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => EditNote(
                          Title: Notes[reverseIndex]["title"],
                          Content: Notes[reverseIndex]["content"],
                          index: Notes[reverseIndex]['cindex'],
                        )))
                .then((value) => setState(() {
                      searchNotes(searchC.text);
                    })),
            child: Container(
              height: 180,
              width: 300,
              child: Card(
                color: colors[Notes[reverseIndex]['cindex']],
                elevation: showShadow ? 4 : 0,
                shadowColor: colors[Notes[reverseIndex]['cindex']],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 40.0,
                      right: 40.0,
                      top: 40,
                      bottom: showDate ? 15 : 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        noTitle
                            ? Container()
                            : Expanded(
                                child: Text(Notes[reverseIndex]["title"],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 24,
                                        color: AppColor.whiteColor)),
                              ),
                        Expanded(
                          child: Text(
                              noContent
                                  ? "Empty"
                                  : Notes[reverseIndex]["content"],
                              maxLines: showDate ? 8 : 9,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color:
                                      noContent ? Colors.white38 : Colors.white,
                                  fontSize: noTitle ? 21 : 16)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        showDate
                            ? Expanded(
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Text(
                                      dateValue == 0
                                          ? "Hôm nay"
                                          : dateValue == -1
                                              ? "Hôm qua"
                                              : date,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          Notes[reverseIndex]["edited"] == "yes"
                                              ? "Edited"
                                              : "",
                                          style: const TextStyle(
                                              color: Colors.white38),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            : Container(),
                      ]),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: IconButton(
                focusColor: Colors.blue,
                onPressed: () async {
                  showDeleteDialog(index: reverseIndex, Notes: Notes);
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 26,
                )),
          ),
        ]),
      ),
    );
  }

  Widget nSmallListView(
      List<Map> Notes, int reverseIndex, int dateValue, String date) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: showShadow ? 2 : 0),
        child: Stack(alignment: Alignment.topRight, children: [
          GestureDetector(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => EditNote(
                          Title: notesMap[reverseIndex]["title"],
                          Content: notesMap[reverseIndex]["content"],
                          index: notesMap[reverseIndex]['cindex'],
                        )))
                .then((value) => setState(() {
                      searchNotes(searchC.text);
                    })),
            child: SizedBox(
              height: 110,
              width: 300,
              child: Card(
                color: colors[Notes[reverseIndex]['cindex']],
                elevation: showShadow ? 4 : 0,
                shadowColor: colors[Notes[reverseIndex]['cindex']],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 15.0,
                      right: noTitle ? 30.0 : 20.0,
                      top: noTitle ? 14.0 : 12.0,
                      bottom: showDate ? 10 : 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        noTitle
                            ? Container()
                            : Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 6, right: 40),
                                child: Text(Notes[reverseIndex]["title"],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 24,
                                        color: Colors.white)),
                              ),
                        Expanded(
                          flex: noTitle ? 2 : 1,
                          child: Text(
                              noContent
                                  ? "Empty"
                                  : Notes[reverseIndex]["content"],
                              maxLines: noTitle
                                  ? showDate
                                      ? 2
                                      : 3
                                  : showDate
                                      ? 1
                                      : 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color:
                                      noContent ? Colors.white38 : Colors.white,
                                  fontSize: noTitle ? 21 : 16)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        showDate
                            ? Expanded(
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Text(
                                      dateValue == 0
                                          ? "Hôm nay"
                                          : dateValue == -1
                                              ? "Hôm qua"
                                              : date,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          Notes[reverseIndex]["edited"] == "yes"
                                              ? "Edited"
                                              : "",
                                          style:
                                              TextStyle(color: Colors.white38),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            : Container(),
                      ]),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: IconButton(
                focusColor: Colors.blue,
                onPressed: () async {
                  showDeleteDialog(index: reverseIndex, Notes: Notes);
                },
                icon: const Icon(
                  Icons.close,
                  color: AppColor.whiteColor,
                  size: 26,
                )),
          ),
        ]),
      ),
    );
  }

  Widget nGridView(
      List<Map> Notes, int reverseIndex, int dateValue, String date) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: showShadow ? 2 : 0),
        child: Stack(alignment: Alignment.topRight, children: [
          GestureDetector(
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => EditNote(
                          Title: notesMap[reverseIndex]["title"],
                          Content: notesMap[reverseIndex]["content"],
                          index: notesMap[reverseIndex]['cindex'],
                        )))
                .then((value) => setState(() {
                      searchNotes(searchC.text);
                    })),
            child: SizedBox(
              height: 180,
              width: 180,
              child: Card(
                color: colors[Notes[reverseIndex]['cindex']],
                elevation: showShadow ? 4 : 0,
                shadowColor: colors[Notes[reverseIndex]['cindex']],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 15.0,
                      right: 20.0,
                      top: noTitle ? 14.0 : 14.0,
                      bottom: showDate ? 10 : 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        noTitle
                            ? Container()
                            : Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 6, right: 40),
                                child: Text(Notes[reverseIndex]["title"],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18,
                                        color: Colors.white)),
                              ),
                        Expanded(
                          flex: noTitle ? 3 : 2,
                          child: Padding(
                            padding: EdgeInsets.only(right: noTitle ? 20.0 : 0),
                            child: Text(
                                noContent
                                    ? "Trống"
                                    : Notes[reverseIndex]["content"],
                                maxLines: noTitle
                                    ? showDate
                                        ? 3
                                        : 4
                                    : showDate
                                        ? 2
                                        : 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: noContent
                                        ? Colors.white38
                                        : Colors.white,
                                    fontSize: noTitle ? 20 : 13)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        showDate
                            ? Expanded(
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Text(
                                      dateValue == 0
                                          ? "Hôm nay"
                                          : dateValue == -1
                                              ? "Hôm qua"
                                              : date,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          Notes[reverseIndex]["edited"] == "yes"
                                              ? "Edited"
                                              : "",
                                          style: const TextStyle(
                                              color: Colors.white38),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                      ]),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: IconButton(
                focusColor: Colors.blue,
                onPressed: () async {
                  showDeleteDialog(index: reverseIndex, Notes: Notes);
                },
                icon: const Icon(
                  Icons.close,
                  color: AppColor.whiteColor,
                  size: 26,
                )),
          ),
        ]),
      ),
    );
  }

  void searchNotes(String query) {
    final searched = notesMap.where((note) {
      final title = note['title'].toString().toLowerCase();
      final content = note['content'].toString().toLowerCase();
      return title.contains(query) || content.contains(query);
    }).toList();
    setState(() {
      searchedNotes = searched;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map> Notes = searchOn ? searchedNotes : notesMap;
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          customAppBar("Ghi Chú", 20, leading()),
          searchOn
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: TextFormField(
                        autofocus: true,
                        controller: searchC,
                        onChanged: searchNotes,
                        maxLines: 1,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: "Tìm kiếm",
                          filled: true,
                          fillColor: Theme.of(context).cardColor,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )),
                  ),
                )
              : Container(),
          notesMap.isNotEmpty
              ? viewIndex != 2
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 2),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: Notes.length,
                          itemBuilder: (context, index) {
                            int reverseIndex = Notes.length - index - 1;
                            notesMap[reverseIndex]["title"] == ""
                                ? noTitle = true
                                : noTitle = false;
                            notesMap[reverseIndex]["content"] == ""
                                ? noContent = true
                                : noContent = false;
                            int dateValue = calculateDifference(
                                notesMap[reverseIndex]["time"]);
                            String date =
                                parseDate(notesMap[reverseIndex]["time"]);
                            Widget chosenView = viewIndex == 0
                                ? nListView(
                                    Notes, reverseIndex, dateValue, date)
                                : nSmallListView(
                                    Notes, reverseIndex, dateValue, date);
                            return chosenView;
                          }),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 2),
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: Notes.length,
                          itemBuilder: (context, index) {
                            int reverseIndex = Notes.length - index - 1;
                            notesMap[reverseIndex]["title"] == ""
                                ? noTitle = true
                                : noTitle = false;
                            notesMap[reverseIndex]["content"] == ""
                                ? noContent = true
                                : noContent = false;
                            int dateValue = calculateDifference(
                                notesMap[reverseIndex]["time"]);
                            String date =
                                parseDate(notesMap[reverseIndex]["time"]);
                            return nGridView(
                                Notes, reverseIndex, dateValue, date);
                          }),
                    )
              : const Padding(
                  padding: EdgeInsets.symmetric(vertical: 200),
                  child: Center(
                      child: Text(
                    "Bạn không có ghi chú nào !",
                    style: TextStyle(
                        color: Colors.pink, fontWeight: FontWeight.w400),
                  )),
                ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }

  int calculateDifference(String stringDate) {
    var date = DateTime.parse(stringDate);
    DateTime now = DateTime.now();
    return DateTime(date.year, date.month, date.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  String parseDate(String stringDate) {
    var date = DateTime.parse(stringDate);
    String parsedDate = DateFormat.MMMMd().format(date);
    return parsedDate;
  }

  Future<void> showDeleteDialog(
      {required List<Map> Notes, required int index}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Xóa ghi chú",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          content: const Text("Bạn có muốn xóa ghi chú này?"),
          actions: [
            TextButton(
                onPressed: () async {
                  await deleteFromDatabase(id: Notes[index]["id"]);
                  setState(() {
                    searchNotes(searchC.text);
                  });
                  Navigator.of(context).pop();
                },
                child: const Text("Xóa", style: TextStyle(color: Colors.red))),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Hủy", style: TextStyle(color: Colors.blue))),
          ],
        );
      },
    );
  }
}
