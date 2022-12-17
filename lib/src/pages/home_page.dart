import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp_clone/src/helpers/hex_color.dart';
import 'package:whatsapp_clone/src/helpers/log.dart';

import '../helpers/k_text.dart';
import '../models/ChatModel.dart';

import 'camera_page.dart';

class Homescreen extends StatefulWidget {
  final List<ChatModel> chatmodels;
  final ChatModel sourchat;

  const Homescreen(
      {super.key, required this.chatmodels, required this.sourchat});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black.withOpacity(.5),
      appBar: AppBar(
        backgroundColor: hexToColor('#128C7E'),
        title: Text("Whatsapp Clone"),
        actions: [
          IconButton(
            icon: Icon(Icons.camera_alt_rounded),
            onPressed: () {
              Get.to(() => CameraPage());
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext contesxt) {
              return [
                PopupMenuItem(
                  child: Text("New group"),
                  value: "New group",
                ),
                PopupMenuItem(
                  child: Text("New broadcast"),
                  value: "New broadcast",
                ),
                PopupMenuItem(
                  child: Text("Whatsapp Web"),
                  value: "Whatsapp Web",
                ),
                PopupMenuItem(
                  child: Text("Starred messages"),
                  value: "Starred messages",
                ),
                PopupMenuItem(
                  child: Text("Settings"),
                  value: "Settings",
                ),
              ];
            },
          )
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Icon(Icons.groups_rounded),
            ),
            Tab(
              text: "Chats",
            ),
            Tab(
              text: "Status",
            ),
            Tab(
              text: "Calls",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          // CameraPage(),
          // ChatPage(
          //   chatmodels: widget.chatmodels,
          //   sourchat: widget.sourchat,
          // ),
          Text("Calls"),
          ChatsListWidget(),

          StatusListWidget(),
          CallsListWidget()
        ],
      ),
    );
  }
}

class StatusListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {},
          onLongPress: () {
            print('object');
          },
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
          leading: Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 22,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: FlutterLogo(),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    kLog('value');
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 10,
                    child: CircleAvatar(
                      backgroundColor: hexToColor('#128C7E'),
                      radius: 9,
                      child: Icon(
                        Icons.add,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          title: KText(
            text: 'My status',
            fontWeight: FontWeight.w600,
          ),
          subtitle: KText(
            text: 'Tap to add status update',
          ),

          dense: true,
          enabled: true,
          autofocus: true,
          // focusColor: hexToColor('#F3F3F3'),
          // hoverColor: hexToColor('#F3F3F3'),
          // selectedColor: hexToColor('#F3F3F3'),
        ),
        Divider(),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_rounded,
              size: 15,
            ),
            SizedBox(width: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                KText(
                  text: 'Your status updates are ',
                  fontSize: 12,
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                    child: KText(
                      text: 'end-to-end encrypted',
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ChatsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(top: 3),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  // color: hexToColor('#E4E4E4'),
                ),
              ),
            ),
            child: ListTile(
              onTap: () {},
              onLongPress: () {
                print('object');
              },
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              leading: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.5),
                        blurRadius: 5.0,
                        spreadRadius: 1,
                        offset: Offset(0.0, 0.0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    )),
                child: CircleAvatar(
                  radius: 22,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: FlutterLogo(),
                  ),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: KText(
                          text: 'Michele Ryana',
                          fontWeight: FontWeight.w600,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      KText(
                        text: '11/11/2022',
                        fontSize: 12,
                      )
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: KText(
                          text:
                              'Yes we can meet fff fdf Yes we can meet fff fdf',
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 2),
                          Icon(Icons.volume_off_rounded),
                          SizedBox(width: 8),
                          CircleAvatar(
                            radius: 9,
                            backgroundColor: Colors.green,
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: KText(
                                text: '1',
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // trailing: KText(text: '11/11/2022'),
              dense: true,
              enabled: true,
              autofocus: true,
              // focusColor: hexToColor('#F3F3F3'),
              // hoverColor: hexToColor('#F3F3F3'),
              // selectedColor: hexToColor('#F3F3F3'),
            ),
          ),
        );
      },
    );
  }
}

class CallsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            onTap: () {},
            onLongPress: () {
              print('object');
            },
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            leading: CircleAvatar(
              backgroundColor: hexToColor('#128C7E'),
              radius: 22,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Icon(
                  Icons.link_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            title: KText(
              text: 'Create call link',
              fontWeight: FontWeight.w600,
            ),
            subtitle: KText(
              text: 'Share a link for your WhatsApp call',
            ),

            dense: true,
            enabled: true,
            autofocus: true,
            // focusColor: hexToColor('#F3F3F3'),
            // hoverColor: hexToColor('#F3F3F3'),
            // selectedColor: hexToColor('#F3F3F3'),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: KText(
              text: 'Recent',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(top: 3),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        // color: hexToColor('#E4E4E4'),
                      ),
                    ),
                  ),
                  child: ListTile(
                    onTap: () {},
                    onLongPress: () {
                      print('object');
                    },
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    leading: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.5),
                              blurRadius: 5.0,
                              spreadRadius: 1,
                              offset: Offset(0.0, 0.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          )),
                      child: CircleAvatar(
                        radius: 22,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: FlutterLogo(),
                        ),
                      ),
                    ),
                    title: KText(
                      text: 'Michele Ryana',
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                    ),
                    subtitle: Row(
                      children: [
                        Icon(
                          index.isEven
                              ? Icons.call_made_rounded
                              : Icons.call_received_rounded,
                          size: 14,
                          color: index.isEven ? Colors.green : Colors.redAccent,
                        ),
                        SizedBox(width: 4),
                        KText(
                          text: '(3) 8 December, 10:30 pm',
                          fontSize: 12,
                        ),
                      ],
                    ),
                    trailing: InkWell(
                      child: Icon(Icons.phone, color: Colors.green),
                    ),
                    dense: true,
                    enabled: true,
                    autofocus: true,
                    // focusColor: hexToColor('#F3F3F3'),
                    // hoverColor: hexToColor('#F3F3F3'),
                    // selectedColor: hexToColor('#F3F3F3'),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
