import 'package:flutter/material.dart';
import 'package:iconnect/core/viewmodels/chat_viewmodel.dart';
import 'package:iconnect/ui/shared/app_colors.dart';
import 'package:iconnect/ui/views/base_view.dart';
import 'package:iconnect/ui/views/chats/components/body.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ChatViewModel>(
        onModelReady: (model) {},
        builder: (context, model, child) {
          return Scaffold(
            appBar: buildAppBar(),
            body: const Body(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              backgroundColor: kPrimaryColor,
              child: const Icon(
                Icons.person_add_alt_1,
                color: Colors.white,
              ),
            ),
            bottomNavigationBar: buildBottomNavigationBar(model),
          );
        });
  }

  BottomNavigationBar buildBottomNavigationBar(ChatViewModel model) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: model.selectedIndex,
      onTap: model.setSelectedIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.message_rounded), label: 'Chats'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'contact '),
        BottomNavigationBarItem(
            icon: Icon(Icons.call_outlined), label: 'Chats'),
        BottomNavigationBarItem(
          icon: CircleAvatar(
              backgroundImage: AssetImage('assets/images/user_2.png')),
          label: 'Profile',
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
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
    );
  }
}
