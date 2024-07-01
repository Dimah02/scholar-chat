import 'package:flutter/material.dart';
import 'package:scholar_chat/constants.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({
    Key? key,
  }) : super(key: key);

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
          child: const Text(
            "Hello how are you",
            style: TextStyle(
              color: Colors.white,
            ),
          )),
    );
  }
}
