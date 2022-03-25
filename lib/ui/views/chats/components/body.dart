import 'package:flutter/material.dart';
import 'package:iconnect/core/models/chat_model.dart';
import 'package:iconnect/core/network/logger.dart';
import 'package:iconnect/core/viewmodels/chat_viewmodel.dart';
import 'package:iconnect/ui/shared/app_colors.dart';
import 'package:iconnect/ui/shared/ui_helpers.dart';
import 'package:iconnect/ui/views/base_view.dart';
import 'package:iconnect/ui/widgets/filloutline_Button.dart';
import 'package:logger/logger.dart';

Logger logger = getLogger('ChatView');

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double KdefaultPadding = 6.0;
    return BaseView<ChatViewModel>(
      onModelReady: (model) {
        model.chatData;
      },
      builder: (context, model, child) {
        return Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(
                  KdefaultPadding, 0, KdefaultPadding, KdefaultPadding),
              color: kPrimaryColor,
              child: Row(
                children: <Widget>[
                  UIHelper.horizontalSpaceSmall(),
                  FillOutlineButton(press: () {}, text: 'Recent Message'),
                  UIHelper.horizontalSpaceSmall(),
                  FillOutlineButton(
                    press: () {},
                    text: 'Active',
                    isFilled: false,
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                //  physics: NeverScrollableScrollPhysics(),
                itemCount: model.chatData.length,
                itemBuilder: (context, index) =>
                    buildChatCard(model, index, context, chatsData[index], () {
                  model.createChatRoomAndStartConversation(context);
                  logger.i(model.chatData[index].name);
                }),
              ),
            )
          ],
        );
      },
    );
  }

  Widget buildChatCard(
      ChatViewModel model, int index, context, Chat chat, VoidCallback press) {
    double KdefaultPadding = 6.0;
    return InkWell(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: KdefaultPadding, vertical: KdefaultPadding * 2),
        child: Row(
          children: <Widget>[
            Stack(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(model.chatData[index].image),
                ),
                if (model.chatData[index].isActive)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              width: 1)),
                    ),
                  )
              ],
            ),
            UIHelper.horizontalSpaceSmall(),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: KdefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.chatData[index].name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Opacity(
                    opacity: 0.64,
                    child: Text(
                      model.chatData[index].lastMessage,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            )),
            Opacity(opacity: 0.64, child: Text(model.chatData[index].time)),
          ],
        ),
      ),
    );
  }
}
