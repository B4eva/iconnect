import 'package:flutter/material.dart';
import 'package:iconnect/core/models/chat_message.dart';
import 'package:iconnect/core/viewmodels/conversation_viewmodel.dart';
import 'package:iconnect/ui/shared/app_colors.dart';
import 'package:iconnect/ui/shared/ui_helpers.dart';
import 'package:iconnect/ui/views/base_view.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ConversationViewModel>(
      onModelReady: (model) {},
      builder: (context, model, child) {
        return Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: ListView.builder(
                    itemCount: model.demoChatMessages.length,
                    itemBuilder: (context, index) {
                      return Message(
                        message: model.demoChatMessages[index],
                      );
                    }),
              ),
            ),
            // Spacer(),
            ChatInputField()
          ],
        );
      },
    );
  }
}

class Message extends StatelessWidget {
  final ChatMessage? message;
  final ConversationViewModel? model;
  const Message({Key? key, this.message, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          message!.isSender! ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        if (!message!.isSender!) ...[
          CircleAvatar(
              radius: 12,
              backgroundImage: AssetImage('assets/images/user_2.png')),
          UIHelper.horizontalSpaceSmall()
        ],
        TextMessage(),
      ],
    );
  }
}

class TextMessage extends StatelessWidget {
  final ChatMessage? message;

  const TextMessage({
    Key? key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(30)),
      child: Text(
        'Hey there',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 32,
                color: Color(0xFF087949).withOpacity(0.08)),
          ]),
      child: SafeArea(
        child: Row(children: <Widget>[
          Icon(
            Icons.mic,
            color: kPrimaryColor,
          ),
          SizedBox(
            width: 6,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              height: 50,
              decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40)),
              child: Row(children: <Widget>[
                Icon(
                  Icons.sentiment_satisfied_alt_outlined,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.64),
                ),
                UIHelper.horizontalSpaceSmall(),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Type message...', border: InputBorder.none),
                )),
                Icon(
                  Icons.attach_file,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.64),
                ),
                UIHelper.horizontalSpaceSmall(),
                Icon(
                  Icons.camera_alt_outlined,
                  color: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .color!
                      .withOpacity(0.64),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
