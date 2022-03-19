import 'package:flutter/material.dart';
import 'package:iconnect/core/viewmodels/welcome_viewmodel.dart';
import 'package:iconnect/ui/shared/app_colors.dart';
import 'package:iconnect/ui/shared/contant_text.dart';
import 'package:iconnect/ui/shared/ui_helpers.dart';
import 'package:iconnect/ui/views/auth_view.dart';
import 'package:iconnect/ui/views/base_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<WelcomeViewModel>(
      onModelReady: (model) {},
      builder: (context, model, child) => Scaffold(
          body: SafeArea(
              child: SizedBox(
        child: Column(
          children: <Widget>[
            const Spacer(),
            Text(
              welcomeText,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const Spacer(),
            Image.asset('assets/images/welcome_image.png'),
            const Spacer(
                //flex: 1
                ),
            Expanded(
              child: PageView.builder(
                onPageChanged: model.setCurrentPage,
                itemCount: model.welcomeScreenAnimationMessages.length,
                itemBuilder: (context, index) => Text(
                  model.welcomeScreenAnimationMessages[index].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.64)),
                ),
              ),
            ),
            UIHelper.verticalSpaceExtraSmall(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  model.welcomeScreenAnimationMessages.length,
                  (index) => buildDot(index, model)),
            ),
            const Spacer(),
            FittedBox(
              child: TextButton(
                  onPressed: () {
                    model.navigateToAuthView(context);
                  },
                  child: Row(
                    children: <Widget>[
                      Text(
                        skip,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .color!
                                .withOpacity(0.8)),
                      ),
                      UIHelper.horizontalSpaceExtraSmall(),
                      Icon(Icons.arrow_forward_ios_outlined,
                          size: 16,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .color!
                              .withOpacity(0.8))
                    ],
                  )),
            )
          ],
        ),
      ))),
    );
  }

  AnimatedContainer buildDot(int index, WelcomeViewModel model) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 8,
      width: model.currentPage == index ? 15 : 8,
      decoration: BoxDecoration(
          color: model.currentPage == index ? grey : black,
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
