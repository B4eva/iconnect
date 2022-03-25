import 'package:flutter/material.dart';
import 'package:iconnect/ui/shared/ui_helpers.dart';
import 'package:iconnect/ui/views/chats/chat_view.dart';
import 'package:iconnect/ui/views/conversation/components/body.dart';

class ConversationView extends StatelessWidget {
  const ConversationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context),
      body: Body(),
    );
  }

  AppBar buildAppbar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(
          context,
          MaterialPageRoute(builder: (_) => ChatView()),
        ),
      ),
      title: Row(children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/user_2.png'),
        ),
        UIHelper.horizontalSpaceSmall(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Ndam Lesly',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'online',
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ]),
    );
  }
}
