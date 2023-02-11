import 'package:convox/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MemosPage extends StatelessWidget {
  MemosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles().appBarColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Memo",
          style: TextStyle(color: Styles().textColor, fontSize: 17),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.edit_note_sharp,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: kToolbarHeight * 2),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 20,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(index.toString()),
                        background: Container(
                          alignment: Alignment.centerRight,
                          color: Colors.white,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment:  MainAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  height: double.infinity,
                                  color: Colors.grey,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.more_horiz,
                                        size: 40.0,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "More",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: double.infinity,
                                  padding: EdgeInsets.all(10),
                                  color: Styles().seelectedCountryName,
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.archive,
                                        size: 40.0,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Archive",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                        direction: DismissDirection.endToStart,
                        confirmDismiss: (direction) {
                          return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Konfirmasi'),
                                  content: const Text(
                                      'Apakah Yakin Menghapus item ini'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(true);
                                      },
                                      child: const Text('Yes'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                      child: const Text('no'),
                                    )
                                  ],
                                );
                              });
                        },
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(
                              left: 10, right: 10, bottom: 3, top: 3),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=800"),
                                radius: 28,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Alice",
                                          style: TextStyle(
                                              color: Styles().textColor,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${DateFormat("MM/dd/yyyy").format(DateTime.now())}",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 15),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Align(
                                      child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                      alignment: Alignment.topRight,
                                    ),
                                    SizedBox(height: 3),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.mic,
                                          color: Colors.green,
                                        ),
                                        Text("0:15",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15))
                                      ],
                                    ),
                                    SizedBox(height: 3),
                                    Divider(
                                      color: Colors.grey,
                                      thickness: 1,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: kToolbarHeight * 2,
              color: Styles().appBarColor,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Favorite Memo",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 20,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            padding:
                                EdgeInsets.only(right: 20, left: 20, bottom: 3),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=800"),
                                  radius: 25,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Alice",
                                  style: TextStyle(
                                      color: Styles().textColor, fontSize: 17),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Icon(Icons.chat), Text("Chats")],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Icon(Icons.settings), Text("Chats")],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
