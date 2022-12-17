import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/ButtonCard.dart';
import '../models/ChatModel.dart';
import 'home_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ChatModel? sourceChat;
  List<ChatModel> chatmodels = [
    ChatModel(
      name: "Dev Stack",
      isGroup: false,
      currentMessage: "Hi Everyone",
      time: "4:00",
      icon: "person.svg",
      id: 1,
    ),
    ChatModel(
      name: "Kishor",
      isGroup: false,
      currentMessage: "Hi Kishor",
      time: "13:00",
      icon: "person.svg",
      id: 2,
    ),
    ChatModel(
      name: "Collins",
      isGroup: false,
      currentMessage: "Hi Dev Stack",
      time: "8:00",
      icon: "person.svg",
      id: 3,
    ),
    ChatModel(
      name: "Balram Rathore",
      isGroup: false,
      currentMessage: "Hi Dev Stack",
      time: "2:00",
      icon: "person.svg",
      id: 4,
    ),
    ChatModel(
      name: "NodeJs Group",
      isGroup: true,
      currentMessage: "New NodejS Post",
      time: "2:00",
      icon: "groups.svg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatmodels.length,
        itemBuilder: (contex, index) => InkWell(
          onTap: () {
            sourceChat = chatmodels.removeAt(index);
            Get.offAll(Homescreen(
              chatmodels: chatmodels,
              sourchat: sourceChat!,
            ));
          },
          child: ButtonCard(
            name: chatmodels[index].name,
            icon: Icons.person,
          ),
        ),
      ),
    );
  }
}
