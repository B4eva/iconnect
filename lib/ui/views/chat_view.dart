import 'package:flutter/material.dart';
import 'package:iconnect/core/viewmodels/chat_viewmodel.dart';
import 'package:iconnect/ui/views/base_view.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ChatViewModel>(
        onModelReady: (model) {},
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text('Chats'),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.search,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          );
        });
  }
}
