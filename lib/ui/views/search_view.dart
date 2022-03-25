import 'package:flutter/material.dart';
import 'package:iconnect/core/enums.dart';

import 'package:iconnect/core/viewmodels/search_viewmodel.dart';
import 'package:iconnect/ui/shared/app_colors.dart';
import 'package:iconnect/ui/shared/ui_helpers.dart';
import 'package:iconnect/ui/views/base_view.dart';
import 'package:iconnect/utils/loading_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SearchViewModel>(
      onModelReady: (model) {},
      builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              title: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: model.serachTextEditingController,
                      cursorColor: Colors.blue,
                      decoration: const InputDecoration(
                          hintText: 'Search username...',
                          hintStyle: TextStyle(color: kSecondaryColor),
                          border: InputBorder.none),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        model.initiateSearach();
                      },
                      child: const Icon(Icons.search_outlined,
                          color: Colors.white))
                ],
              ),
            ),
            body: model.state == ViewState.idle
                ? Column(
                    children: [
                      searchList(model),
                    ],
                  )
                : loadWidget);
      },
    );
  }

  Widget searchList(SearchViewModel model) {
    return
        //model.searchSnapshot != null
        ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return const SearchTile(
                username: 'B4eva',
                email: 'tanzebright@gmail.com',
                // username: model.searchSnapshot!.docs[index]['name'],
                // email: model.searchSnapshot!.docs[index]['email'],
              );
            });

    //  Container(
    //     color: Colors.red,
    //   );
  }
}

class SearchTile extends StatelessWidget {
  final String? username;
  final String? email;
  const SearchTile({Key? key, this.username, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(username!),
                UIHelper.verticalSpaceSmall(),
                Text(email!),
              ],
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.blue),
              child: GestureDetector(
                  onTap: () {
                    print('Message');
                  },
                  child: const Text(
                    'Message',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
