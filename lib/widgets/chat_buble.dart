import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';

class ChatBuble extends StatelessWidget {
  ChatBuble({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          padding:
              const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            color: kprimaryColor,
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          )),
    );
  }
}

class ChatBubleFromFriend extends StatelessWidget {
  ChatBubleFromFriend({Key? key, required this.text}) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          padding:
              const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 16),
          margin: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32),
            ),
            color: Color(0XFF006D84),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          )),
    );
  }
}
